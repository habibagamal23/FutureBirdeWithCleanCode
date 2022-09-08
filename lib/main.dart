import 'package:flutter/material.dart';
import 'package:future_bride/app/di.dart';

import 'app/app.dart';

void main()async {

WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();

  runApp( MyApp());
}


