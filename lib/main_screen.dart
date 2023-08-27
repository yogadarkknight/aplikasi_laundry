import 'package:flutter/material.dart';
import 'package:aplikasi_laundry/model/laundry_type.dart';
import 'package:aplikasi_laundry/detail_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Laundry'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          if (constraints.maxWidth <=600){
            return LaundryTypeList();
          }
          else if (constraints.maxWidth <= 1200){
            return LaundryTypeGrid(gridCount: 4);
          }
          else {
            return LaundryTypeGrid(gridCount: 6);
          }
        },
      ),
    );
  }
}

class LaundryTypeList extends StatelessWidget {
  const LaundryTypeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final LaundryType type = laundryTypeList[index];
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailScreen(type: type);
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Image.asset(type.imageAsset)
                  ),
                  Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              type.name,
                              style: const TextStyle(fontSize: 16.0),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
      itemCount: laundryTypeList.length,
        );
  }
}

class LaundryTypeGrid extends StatelessWidget {
  final int gridCount;

  const LaundryTypeGrid({Key? key, required this.gridCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
            crossAxisCount: gridCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: laundryTypeList.map((type){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return DetailScreen(type: type);
              }));
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: Image.asset(type.imageAsset, fit: BoxFit.cover
                      ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            type.name,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Text(
                      type.description
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        ),
    );
  }
}


