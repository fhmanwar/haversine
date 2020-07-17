import 'package:flutter/material.dart';

import '../models/Stores.dart';
import '../models/Stores.dart';

class ItemHorizontal extends StatelessWidget {
  const ItemHorizontal(this._stores);
  @required
  final Stores _stores;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Hero(
                    // tag: "image${_stores.name}",
                    child: FadeInImage.assetNetwork(
                      placeholder: "assets/no_image.png",
                      // placeholder: "",
                      // image: _stores.images,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: GestureDetector(
                  child: Text(
                    // _stores.name??'',
                    '',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () => goToDetailsPage(context, _stores),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  goToDetailsPage(BuildContext context, Stores stores) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        // builder: (BuildContext context) => Detail(
        //       anggreks: stores,
        //     ),
        builder: (context) {
          
        },
      ),
    );
  }
}
