import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_news/last_news_app.dart';
import 'package:last_news/view_model/cubit/observer.dart';
import 'package:last_news/view_model/data/remote/dio_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const LastNewsApp());
}
