
import 'package:flutter/material.dart';
import 'package:careyaya/models/sessions/session.model.dart';
import 'package:careyaya/ui/screens/example_sessions.dart';

final session = ExampleSessions().generateSessions()[0];


class SessionDetailWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(

        children:[
          SizedBox(height:30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Loved Ones Name:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.underline
                  )),
              Text('${session.lovedOneId}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(height:25),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status:',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        decoration: TextDecoration.underline
                    )),
                Chip(label: Text(session.accepted ? "Accepted" : "Requested")),
            ],
          ),
          SizedBox(height:25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Time:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.underline
                  )),
              Text('${session.timeSlots[1]} - ${session.timeSlots[session.timeSlots.length-1]}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ))
            ],
          ),
          SizedBox(height:30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Location:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.underline
                )),
              Text('${session.address.line1} \n${session.address.city}, ${session.address.state} \n${session.address.zip} ' ,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,

              ),
            ],
          ),
          SizedBox(height:30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Distance Away:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.underline
                  )),
              Text('${session.distance}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(height:30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Rate:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.underline
                  )),
              Text('${session.hourlyRate/100} / HR',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(height:30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Cost:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.underline
                  )),
              Text('${session.totalCost/100} dollars',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(height:30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Payment Method:',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      decoration: TextDecoration.underline
                  )),
              Text('${session.stripePaymentIntentId}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                  )),
            ],
          ),]
    );
  }

}