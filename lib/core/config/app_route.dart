import 'package:flutter/material.dart';

import '../../feature/store/screens/store_screen.dart';


class AppRoutes {
  static const String store = '/';



  static Map<String, WidgetBuilder> routes = {
        store: (context) => const StoreScreen(),

      };
    }