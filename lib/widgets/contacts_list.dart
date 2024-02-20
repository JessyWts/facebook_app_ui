import 'package:facebook_app_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;
  const ContactsList({ Key? key, required this.users }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      constraints: const BoxConstraints(maxWidth: 280.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 18.0,fontWeight: FontWeight.w500
                  ),
                )
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 8.0,),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              shrinkWrap: true,
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final User user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(user: user),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}