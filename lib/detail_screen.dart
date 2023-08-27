import 'package:flutter/material.dart';
import 'package:aplikasi_laundry/model/laundry_type.dart';
import 'package:input_quantity/input_quantity.dart';

class DetailScreen extends StatelessWidget {
  final LaundryType type;
  const DetailScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          if (constraints.maxWidth > 800) {
            return DetailWebPage(type : type);
          } else {
            return DetailMobilePage(type : type);
          }
        },
        );
  }
}

//tampilan untuk versi Mobile

class DetailMobilePage extends StatelessWidget {
  final LaundryType type;
  const DetailMobilePage({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(type.imageAsset),
                SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          const FavoriteButton(),
                        ],
                      ),
                    ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                type.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(Icons.archive_rounded),
                      const SizedBox(height: 8.0),
                      Text(
                        type.maxWeight,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.monetization_on),
                      const SizedBox(height: 8.0),
                      Text(
                        type.price,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(19.0),
              child: Text(
                type.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('Berat Pakaian',
                      textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      InputQty(
                        maxVal: 100,
                          minVal: 0,
                          borderShape: BorderShapeBtn.circle,
                          boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          steps: 10,
                          onQtyChanged: (val){
                          print(val);
                          }
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                            child: Container(
                            decoration: const BoxDecoration(
                            gradient: LinearGradient(
                            colors: <Color>[
                                Color(0xFF0D47A1),
                                Color(0xFF1976D2),
                                Color(0xFF42A5F5),
                            ],
                        ),
                        ),
                        ),
                          ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.all(16.0),
                                textStyle: const TextStyle(
                                  fontSize: 20.0
                                )
                              ),
                                onPressed: (){},
                                child: Text('Submit')
                            ),
                          ]
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Website view
class DetailWebPage extends StatefulWidget {
  final LaundryType type;

  const DetailWebPage({Key? key, required this.type}) : super(key: key);

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: SizedBox(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Aplikasi Laundry',
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    fontSize: 32,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.asset(widget.type.imageAsset),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          const SizedBox(height: 16),
                          // Scrollbar(
                          //   controller: _scrollController,
                          //   child: Container(
                          //     height: 150,
                          //     padding: const EdgeInsets.only(bottom: 16),
                          //     child: ListView(
                          //         controller: _scrollController,
                          //         scrollDirection: Axis.horizontal,
                          //         children: widget.type.imageUrls.map((url) {
                          //           return Padding(
                          //             padding: const EdgeInsets.all(4.0),
                          //             child: ClipRRect(
                          //               borderRadius: BorderRadius.circular(10),
                          //               child: Image.network(url),
                          //             ),
                          //           );
                          //         }).toList()
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    widget.type.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 30.0,
                                        fontFamily: 'Staatliches'
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: <Widget>[
                                          const Icon(Icons.archive_rounded),
                                          const SizedBox(width: 8.0),
                                          Text(
                                            widget.type.maxWeight,
                                          ),
                                        ],
                                      ),
                                      const FavoriteButton()
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Column(
                                  children: <Widget>[
                                    const Icon(Icons.monetization_on),
                                    const SizedBox(width: 8.0),
                                    Text(
                                      widget.type.price,

                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                                  child: Text(
                                    widget.type.description,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }
}


class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}
class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
