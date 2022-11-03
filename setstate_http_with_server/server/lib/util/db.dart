import 'package:monalisa/env.dart';
import 'package:mysql1/mysql1.dart';

class DB {
  static late MySqlConnection conn;
  static connect() async {
    var settings = ConnectionSettings(
      host: Env.host,
      port: Env.port,
      user: Env.user,
      password: Env.password,
      db: Env.database,
    );
    conn = await MySqlConnection.connect(settings);
    print("MySQL is connected!");
  }

  static DBTable table(String tableName) {
    return DBTable(
      table: tableName,
    );
  }
}

class DBTableItem {}

class DBTable {
  final String table;
  final List<String>? conditions;
  DBTable({
    required this.table,
    this.conditions,
  });

  DBTable where(String key, dynamic operator, dynamic value) {
    List<String> cond = conditions ?? [];
    cond.add('"$key" $operator "$value"');
    var newConditions = cond;
    return DBTable(
      table: table,
      conditions: newConditions,
    );
  }

  insert(Map value) async {
    var params = value.keys.length;
    List fieldDefintion = [];
    List valueDefinition = [];

    value.forEach((key, value) {
      fieldDefintion.add("$key");

      if (value is int || value is double) {
        valueDefinition.add('$value');
      } else {
        valueDefinition.add('"$value"');
      }
    });

    await DB.conn.query(
      "insert into $table (${fieldDefintion.join(",")}) values(${valueDefinition.join(",")})",
    );
  }

  Future<List> get() async {
    return [];
  }

  String getType(value) {
    if (value.toString().contains("integer")) {
      return "int";
    }
    if (value.toString().contains("double")) {
      return "float";
    }
    return "varchar(255)";
  }

  define(Map definition) async {
    var fields = [];
    var primaryKey;

    definition.forEach((key, value) {
      bool isPrimaryKey = false;
      var type = getType(value);

      if (value.toString().contains("primary")) {
        primaryKey = key;
        isPrimaryKey = true;
      }

      if (key != "id") {
        fields.add("$key $type NOT NULL");
      } else {
        fields.add("$key $type NOT NULL AUTO_INCREMENT");
      }
    });

    if (primaryKey != null) {
      primaryKey = "PRIMARY KEY (id)";
    }
    await DB.conn.query("create table $table (${fields.join(",")})");
  }

  drop() async {
    await DB.conn.query("drop table $table");
  }

  dropIfExists() async {
    await DB.conn.query("drop table if exists $table");
  }
}

test() async {
  DB.table("product").insert({
    "product_name": "Test",
    "price": 25,
    "description": "-",
  });

  List products = await DB
      .table("product")
      .where("product_name", "=", "Deny")
      .where("category", "=", "Product")
      .get();

  //Migrations
  DB.table("product").dropIfExists();
  DB.table("product").define({
    "id": "integer:primary",
    "product_name": "text",
  });
}
