import 'package:flutter/material.dart';
import 'package:json_cubit/src/core/utils/link_open.dart';
import 'package:json_cubit/src/core/utils/utility_launcher.dart';
import 'package:json_cubit/src/features/contact/models/contact_model.dart';

class ContactDetailsPage extends StatefulWidget {
  final ContactModel contactDetails;
  // ignore: use_key_in_widget_constructors
  const ContactDetailsPage({required this.contactDetails});

  @override
  State<ContactDetailsPage> createState() => _ContactDetailsPageState();
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contactDetails.name ?? "",
            style: const TextStyle(
                fontSize: 28,
                color: Colors.white70,
                fontWeight: FontWeight.w700)),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(widget.contactDetails.photo ?? ""),
            Text(
              widget.contactDetails.name ?? "",
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Card(
              borderOnForeground: true,
              child: Text(
                widget.contactDetails.address ?? "",
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  LauncherUtility.makeCall(widget.contactDetails.contact ?? "");
                },
                title: Center(
                  child: Row(
                    children: [
                      const Card(
                        child: Center(
                          child: Icon(
                            Icons.phone,
                            color: Colors.green,
                            size: 25,
                          ),
                        ),
                      ),
                      Text(
                        widget.contactDetails.contact ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
           Card(child:
           ListTile(
              title: Center(
                child: Row(
                  children: [
                    const Card(
                      child: Center(
                        child: Icon(
                          Icons.web,
                          color: Colors.blue,
                          size: 25,
                        ),
                      ),
                    ),
                    Text(
                      widget.contactDetails.url ?? "",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              onTap: () {
                LinkOpen.openLink(widget.contactDetails.url ?? "");
              },
            ),),
          ],
        ),
      ),
    );
  }
}
