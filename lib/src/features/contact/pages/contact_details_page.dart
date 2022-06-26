
import 'package:flutter/material.dart';
import 'package:json_cubit/src/core/utils/link_open.dart';
import 'package:json_cubit/src/core/utils/utility_launcher.dart';
import 'package:json_cubit/src/features/contact/models/contact_model.dart';

class ContactDetailsPage extends StatefulWidget {
final ContactModel contactDetails;
  const ContactDetailsPage({required this.contactDetails}) ;

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Details"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(widget.contactDetails.photo??""),
            Text(
               widget.contactDetails.name??"",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
               widget.contactDetails.address??"",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            ListTile(
              onTap: () {
                LauncherUtility.makeCall( widget.contactDetails.contact??"");
              },
              title: Text(
                widget.contactDetails.contact?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            ListTile(
              title: Text(
                widget.contactDetails.url?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    fontWeight: FontWeight.w200),
              ),
              onTap: () {
                LinkOpen.openLink(widget.contactDetails.url?? "");
              },
            ),
          ],
        ),
      ),
    );
  }
}
