import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/bloc/MainBloc.dart';
import 'package:new_project/bloc/MainState.dart';
import 'package:new_project/listeners/MainListener.dart';
import 'package:new_project/providers/MainProvide.dart';

class MainScreen extends StatelessWidget {
  int productIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MainProvider(
      child: MainListener(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Бургер Кинг',style: TextStyle(color: Colors.white, fontSize: 16)),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Icon(Icons.info_outline, color: Colors.white),
              )
            ],
            leading: Icon(Icons.arrow_back, color: Colors.white),
          ),
          body: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state is MainSuccess)
              {
                return Container(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 50),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.dataList.length,
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  productIndex = index;
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 3),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                        child: Text('${state.dataList[index].name}',style: TextStyle(color: Colors.black)),
                                      )
                                    ),
                                  );
                                }
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                                      child: Text('${state.dataList[index].name}', style: TextStyle(color: Colors.grey)),
                                    )
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            child: GridView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: state.dataList[productIndex].products.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 7,
                                mainAxisSpacing: 8
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                print(productIndex);
                                return new Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(maxHeight: 120, minHeight: 120),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: const Radius.circular(20),
                                                  topRight: const Radius.circular(20),
                                                ),
                                              ),
                                              child: Image.network(
                                                '${state.dataList[productIndex].products[index].image}'
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: const Radius.circular(20),
                                              bottomRight: const Radius.circular(20),
                                            ),
                                          ),
                                          width: MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text('${state.dataList[productIndex].products[index].name}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10),
                                                child: Text('${state.dataList[productIndex].products[index].price} Р', style: TextStyle(color: Colors.white)),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              if (state is MainLoading)
              {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              else
              {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
