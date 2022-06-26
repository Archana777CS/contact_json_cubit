import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_cubit/src/core/constants/app_strings.dart';
import 'package:json_cubit/src/features/contact/cubit/contact_cubit.dart';
import 'package:json_cubit/src/features/contact/pages/contact_details_page.dart';
import '../models/contact_model.dart';

class MyContact extends StatefulWidget {
  const MyContact({Key? key}) : super(key: key);

  @override
  _MyContactState createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactCubit()..getContactData(),
      child: Scaffold(
        appBar: AppBar(title: Text(AppStrings.heading1),),
        body: BlocBuilder<ContactCubit, ContactState>(
          builder: (context, state) {
            if (state is ContactInitial) {
              return Container();
            } else if (state is ContactLoading) {
              return const CupertinoActivityIndicator();
            } else if (state is ContactLoaded) {

              return ListView.builder(
                  itemCount: state.contactList.length,
                  itemBuilder: (_, pos) {
                    ContactModel contacts= state.contactList[pos];
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage(state.contactList[pos].photo ?? ""),
                      ),
                      title: Text(state.contactList[pos].name ?? ""),
                      subtitle: Text(state.contactList[pos].contact ?? ""),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactDetailsPage(contactDetails:contacts,)));
                      },
                    );
                  });
            } else if (state is ContactLoadError) {
              return Text(AppStrings.errorMessage);
            }
            return Container();
          },
        ),
      ),
    );
  }
}
