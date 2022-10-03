import 'package:go_router/go_router.dart';

import '../main.dart';

get ctx {
  return shellNavigatorKey.currentState!.context;
}

go(routeName) {
  GoRouter.of(ctx).go(
    routeName,
  );
}
