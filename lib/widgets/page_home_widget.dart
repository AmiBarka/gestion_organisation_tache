import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String type;
  final String title;
  final String startDate;
  final String endDate;
  final String state;
  final double progress;

  TaskItem({
    required this.type,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.state,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '$type',
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(width: 230),
              Icon(Icons.more_horiz), // This is the three dots icon
            ],
          ),
          SizedBox(height: 8),
          Text(
            '$title',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(
            '$state',
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: progress / 100,
                  color: Colors.blue,
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  '$progress%',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.edit_calendar_sharp,
                    color: Colors.blue,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text('$startDate', style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(width: 13),
              Row(
                children: [
                  const Icon(
                    Icons.flag_outlined,
                    color: Colors.blue,
                    size: 20,
                  ),
                  SizedBox(width: 6),
                  Text('$endDate', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
