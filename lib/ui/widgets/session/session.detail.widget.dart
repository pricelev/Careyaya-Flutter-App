import 'package:careyaya/ui/screens/example_sessions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final session = ExampleSessions().generateSessions()[3];

class SessionDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height:25),
      ExpansionTile(
        title: Text(
          'Appointment Information',
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
            )
        ),
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Loved Ones Name:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      decoration: TextDecoration.underline)),
              Text('${session.lovedOneId}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(height: 20),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Time:',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.underline)),
            Text(
              '${DateFormat('hh:mm aa').format(
                DateTime.fromMillisecondsSinceEpoch(
                    session.startTimestamp.millisecondsSinceEpoch),
              )} - ${DateFormat('hh:mm aa').format(
                DateTime.fromMillisecondsSinceEpoch(
                    session.endTimestamp.millisecondsSinceEpoch),
              )}',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )
          ],
        ),
          SizedBox(height: 5),]
      ),
      ExpansionTile(
        title: Text(
            'Location Information',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )
        ),
        children:[
          SizedBox(height:10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Address:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      decoration: TextDecoration.underline)),
              Text(
                '${session.address.line1} \n${session.address.city}, ${session.address.state} \n${session.address.zip} ',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Distance Away:',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      decoration: TextDecoration.underline)),
              Text('${session.distance}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  )),
            ],
          ),
          SizedBox(height: 5),
        ]
      ),
      ExpansionTile(
      title: Text(
          'Payment Information',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )
      ),
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Rate:',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.underline)),
            Text('${session.hourlyRate / 100} / HR',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total Earnings:',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    decoration: TextDecoration.underline)),
            Text('${session.totalCost / 100} dollars',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )),
          ],
        ),
        SizedBox(height:5),
      ],
    ),
      ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton.icon(
            onPressed: null,
            icon: Icon(session.accepted ? Icons.cancel : Icons.check),
            label: Text(session.accepted ? "Cancel" : "Accept"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(session.accepted ? Colors.red : Colors.green),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
            ),
          ),
          OutlinedButton.icon(
            onPressed: null,
            icon: Icon(Icons.chat),
            label: Text("Start a chat"),
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(
                  239, 52, 68, 1.0)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0))),
            ),
          )
      ]),
    ]);
  }
}
