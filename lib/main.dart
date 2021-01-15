import 'package:avialdoContactsAppTask/profileView.dart';
import 'package:flutter/material.dart';
import 'service.dart';
import 'profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Avialdo Contacts Task App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Profile> profiles;
  @override
  void initState() {
    super.initState();
    Services.getProfile().then((profile) {
      setState(() {
        profiles = profile;
        profiles.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    void openProfile(String name, String email, String address, String website,
        String phoneNumber) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProfileView(
                  name: name,
                  email: email,
                  address: address,
                  website: website,
                  phoneNumber: phoneNumber)));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        body: Container(
            child: ListView.builder(
                itemCount: null == profiles ? 0 : profiles.length,
                itemBuilder: (context, index) {
                  Profile userProfile = profiles[index];

                  return InkWell(
                    onTap: () {
                      openProfile(
                          userProfile.name,
                          userProfile.email,
                          userProfile.address.getAddress(),
                          userProfile.website,
                          userProfile.phone
                              .replaceAll(RegExp(r'[^\w\s]+'), ' '));
                    },
                    child: ListTile(
                      title: Text(userProfile.name),
                    ),
                  );
                })));
  }
}
