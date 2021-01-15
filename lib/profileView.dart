import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget TextWidget(String title, String data) {
  return Container(
    alignment: Alignment.topLeft,
    child: Column(
      children: [
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(width: 20),
              Text(
                data,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
      ],
    ),
  );
}

class ProfileView extends StatelessWidget {
  final String name, email, address, website, phoneNumber;
  ProfileView(
      {@required this.name,
      @required this.email,
      @required this.address,
      @required this.website,
      @required this.phoneNumber});

  formatPhone(String phoneNumber) {
    String formattedPhoneNumber =
        phoneNumber.replaceAll(RegExp(r'[^\w\s]+'), ' ');
    String phone = formattedPhoneNumber.split('x')[0];
    String phoneExtension = formattedPhoneNumber.split('x').length < 2
        ? ''
        : formattedPhoneNumber.split('x')[1];

    if (phoneExtension == '') {
      return '$phone';
    } else {
      return '$phone $phoneExtension';
    }
  }

  formatPhoneForCall(String phoneNumber) {
    String result = formatPhone(phoneNumber).toString().replaceAll(' ', '');
    return result;
  }

  _launchPhone(number) async {
    // const url = 'https://flutter.dev';
    if (await canLaunch('tel:$number')) {
      await launch('tel:$number');
    } else {
      throw 'Could not launch $number';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget('Name:', name),
            TextWidget('Email:', email),
            TextWidget('Address:', address),
            TextWidget('Website:', website),
            TextWidget('Phone:', '${formatPhone(phoneNumber)}'),
            SizedBox(
              height: 400,
            ),
            RaisedButton(
              child: Text('Call'),
              onPressed: () =>
                  _launchPhone('${formatPhoneForCall(phoneNumber)}'),
            )
          ],
        ),
      ),
    );
  }
}
