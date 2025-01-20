import 'package:flutter/material.dart'; 
import 'package:http.dart' as http; 
import 'dart:convert'; 

class SendNotificationScreen extends StatelessWidget {
    final String iPhoneDeviceToken  ='' 

Future <void> sendNotification() async {
    final url = Uri.parse('https://cloudfunctionurlplaceholder/sendNotification')
    final response = await http.post(
        url, 
        headers: {'Content-Type': 'application/json'}, 
        body: json.encode({'token': iPhoneDevieToken})
    )
    if (response.statusCode == 200) {
        print('notification sent')
    } else {
        print('failed to send notification')
    }
}
@override
Widget build(BuildContext) {
    return Scaffold(
        appBar: AppBar(title: Text('Send Notification')), body: Center(
            child: ElevatedButton(
                onPressed: sendNotification, 
                child: Text('Send Notification to Otto')
            )
        )
    )
}
}