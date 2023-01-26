import 'package:flutter/material.dart';
import 'package:green_corp_app/presentation/widget/appbar_custom.dart';
import 'package:green_corp_app/presentation/widget/info_new_feature.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});
  static const routeName = '/ro/inbox';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(context, "Inbox"),
      body: infoNewFeature(),
    );
  }
}
