import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:time_range/time_range.dart';
import 'dart:math';

class SchedulerController extends GetxController {
  FormFieldState<dynamic> field;
  List<TimeRange> timePickers = <TimeRange>[];
  RxList<TimeRangeResult> timeRanges = RxList<TimeRangeResult>([]);
  final String id;
  var warned = false; // keeps track of if error message for overlapping time intervals should be displayed

  SchedulerController({@required this.field, @required this.id});

  @override
  void onInit() {
    ever(timeRanges, (List<TimeRangeResult> timeRanges) {
      final List<TimeRangeResult> timeRangesCopy = <TimeRangeResult>[];

      timeRanges.forEach((element) {
        timeRangesCopy.add(element);
      });

      timeRangesCopy.removeWhere((timeRange) {
        if (timeRange.start.hour == 0 &&
            timeRange.start.minute == 0 &&
            timeRange.end.hour == 0 &&
            timeRange.end.minute == 0) {
          return true;
        }
        return false;
      });

      final timeRangeObjects = timeRangesCopy.map((timeRange) {
        final startString = '${timeRange.start.hour}:${timeRange.start.minute}';
        final endString = '${timeRange.end.hour}:${timeRange.end.minute}';
        return {
          'start': startString,
          'end': endString,
        };
      }).toList();

      field.didChange(timeRangeObjects);
    });
    super.onInit();
  }

  void handleAddTimePress() {
    this.warned = false;
    final index = timePickers.length;
    timePickers.add(TimeRange(
      fromTitle: Text('From', style: TextStyle(fontSize: 18)),
      toTitle: Text('To', style: TextStyle(fontSize: 18)),
      firstTime: TimeOfDay(hour: 7, minute: 0),
      lastTime: TimeOfDay(hour: 24, minute: 0),
      timeStep: 30,
      timeBlock: 30,
      onRangeCompleted: _getHandleTimeRangeCompleted(index: index),
    ));
    // Add an empty value to be swapped out on edit or remove
    timeRanges.add(
      TimeRangeResult(
        TimeOfDay(hour: 0, minute: 0),
        TimeOfDay(hour: 0, minute: 0),
      ),
    );
    update([id]);
  }

  void handleRemoveTimePress() {
    this.warned = false;
    if (timePickers.length >= 1) {
      timePickers.removeLast();
    }
    if (timeRanges.length >= 1) {
      timeRanges.removeLast();
    }
    update([id]);
  }

  Function _getHandleTimeRangeCompleted({int index}) {
    return (TimeRangeResult range) {
      // Swap out the existing one
      for (var  i = 0; i < index; i++) {
        if (areOverlapping(range, timeRanges[i])) {
          handleRemoveTimePress();
          this.warned = true;
          break;
        }
      }
      timeRanges.removeAt(index);
      timeRanges.insert(index, range);
    };
  }

  bool areOverlapping(TimeRangeResult a, TimeRangeResult b) {
    var startA = toDouble(a.start);
    var endA = toDouble(a.end);
    var startB = toDouble(b.start);
    var endB = toDouble(b.end);
    return max(startA, startB) < min(endA, endB);
  }

  double toDouble(TimeOfDay time) {
    return time.hour + time.minute/60.0;
  }

}

class Scheduler extends StatelessWidget {
  final String day;

  Scheduler({@required this.day});

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: 'schedule.${day}',
      builder: (FormFieldState<dynamic> field) {
        return GetBuilder<SchedulerController>(
          global: false,
          id: day,
          init: SchedulerController(
            field: field,
            id: day,
          ),
          builder: (SchedulerController schedulerController) {
            return Column(children: [
              Text(day),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: schedulerController.timePickers.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      SizedBox(height: 10),
                      schedulerController.timePickers[index],
                      SizedBox(height: 10),
                    ],);
                  }),
              Text(schedulerController.warned ? "Please enter time ranges that don't overlap" : "",
                   style: TextStyle(color: Colors.red)),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                      onPressed: schedulerController.handleAddTimePress,
                      child: Text("+"),
                    ),
                  )),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                      onPressed: schedulerController.handleRemoveTimePress,
                      child: Text("-"),
                    ),
                  )),
                ],
              ),
              SizedBox(height: 10),
            ]);
          },
        );
      },
      validator: FormBuilderValidators.required(context),
    );
  }
}
