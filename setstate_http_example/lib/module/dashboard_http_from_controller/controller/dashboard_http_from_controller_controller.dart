import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fhe_template/state_util.dart';
import '../view/dashboard_http_from_controller_view.dart';

class DashboardHttpFromControllerController
    extends State<DashboardHttpFromControllerView> implements MvcController {
  static late DashboardHttpFromControllerController instance;
  late DashboardHttpFromControllerView view;
  List items = [];

  @override
  void initState() {
    instance = this;
    super.initState();
    loadData();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  loadData() async {
    Response response = await Dio().get(
      "http://localhost:8080/dynamic-api/products?limit=10",
      options: Options(
        contentType: "application/json",
      ),
    );
    Map obj = response.data;
    items = obj["data"];
    update();
  }
}
