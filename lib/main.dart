import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:wedo/channelListPage.dart';
import 'package:wedo/dashboard.dart';

void main() async {
  final client = Client(
    'dbgs9cqjw6gr',
    logLevel: Level.INFO,
  );

  await client.setUser(
    User(
      id: 'polished-sky-5',
      extraData: {
        'image':
            'https://getstream.io/random_png/?id=polished-sky-5&amp;name=Polished+sky',
      },
    ),
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoicG9saXNoZWQtc2t5LTUifQ.v5FPFHuySUHj0S3ugRJzOShQwIz6ltidbVGYpU2i2yo',
  );

  runApp(MyApp(client));
}

class MyApp extends StatelessWidget {
  final Client client;

  MyApp(this.client);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => StreamChat(
        client: client,
        child: child,
      ),
      home: Dashboard(),
      routes: <String, WidgetBuilder>{
        '/channelList': (BuildContext context) => ChannelListPage(),
      },
    );
  }
}
