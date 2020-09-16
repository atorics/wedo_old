import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wedo/channelPage.dart';
import 'package:wedo/main.dart';

class ChannelListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groups"),
        actions: <Widget>[],
        // bottom: PreferredSize(
        //   preferredSize: Size.fromHeight(130.0),
        //   child:// _buildUserInfo(user),
        // ),
      ),
      body: ChannelsBloc(
        child: ChannelListView(
          filter: {
            'members': {
              '\$in': [StreamChat.of(context).user.id],
            }
          },
          sort: [SortOption('last_message_at')],
          pagination: PaginationParams(
            limit: 20,
          ),
          channelWidget: ChannelPage(),
        ),
      ),
    );
  }
}
