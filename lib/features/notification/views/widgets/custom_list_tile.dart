import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.topic,
    required this.message,
    required this.date,
    this.isRead = false,
    this.onTap,
  });

  final String topic;
  final String message;
  final String date;
  final bool isRead;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const CircleAvatar(radius: 13, child: Icon(Icons.info)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(topic).tsTitle().ellipsis(),
          Text(message).tsTitle().ellipsis().maxLn(2).bold(),
        ],
      ),
      trailing: Text(date).tsCaption().clr(Colors.grey),
    );
  }
}
