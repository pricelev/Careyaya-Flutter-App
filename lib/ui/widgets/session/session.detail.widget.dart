
import 'package:flutter/material.dart';
import 'package:careyaya/models/sessions/session.model.dart';
import 'package:careyaya/ui/screens/example_sessions.dart';

final session = ExampleSessions().generateSessions()[0];


class SessionDetailWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
        children:[
          Center(
            child: Container(
                width: 70.0,
                height: 70.0,
                margin: const EdgeInsets.only(top: 20.0,bottom: 40),

                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('https://goheels.com/images/2015/6/2/CGUAZBDTMRQVCFP.20150602144508.jpg?width=1416&height=797&mode=crop&quality=80&format=jpg'),
                    )
                )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Name'),
              Text('${session.lovedOneId}'),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status'),
                Chip(label: Text(session.accepted ? "Accepted" : "Requested")),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Time'),
              Text('${session.timeSlots[1]} - ${session.timeSlots[session.timeSlots.length-1]}')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Location'),
              Text('${session.address.description}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Distance Away'),
              Text('${session.distance}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rate'),
              Text('${session.hourlyRate} / HR'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Cost'),
              Text('${session.totalCost}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Payment Method'),
              Text('${session.stripePaymentIntentId}'),
            ],
          ),]
    );
  }

}