
import 'package:flutter/material.dart';

class SessionDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children:[
        Center(
          child: Container(
              width: 70.0,
              height: 70.0,
              margin: const EdgeInsets.only(top: 20.0),
              decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('https://goheels.com/images/2015/6/2/CGUAZBDTMRQVCFP.20150602144508.jpg?width=1416&height=797&mode=crop&quality=80&format=jpg'),
              )
            )
          ),




        ),
      ]
    );
    throw UnimplementedError();
  }

}