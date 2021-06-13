import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/bloc/MainEvent.dart';
import 'package:new_project/bloc/MainState.dart';
import 'package:new_project/models/Data.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    add(MainLoad());
  }

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    yield MainLoading();
    yield MainSuccess(dataList: await _loadData());
  }
}

Future<List<Data>> _loadData() async {
  final jsonString  = await rootBundle.loadString('lib/assets/data.json');

  var map = jsonDecode(jsonString)["data"] as List<dynamic>;

  List<Data> dataList = map.map((item) => Data.fromMap(item)).toList();

  return dataList;
}
