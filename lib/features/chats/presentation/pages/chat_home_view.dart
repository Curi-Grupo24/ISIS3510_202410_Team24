// ignore_for_file: always_specify_types

part of com.curi.app.chats.pages;

class ChatHomeViewDashboard extends StatefulWidget {
  const ChatHomeViewDashboard({super.key});

  @override
  State<ChatHomeViewDashboard> createState() => _ChatHomeViewDashboardState();
}

class _ChatHomeViewDashboardState extends State<ChatHomeViewDashboard> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: _buildUserList(),
      );

  Widget _buildUserList() => StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
        ) {
          if (snapshot.hasError) {
            return Text('Ocurrió un error'.tr);
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('esperanding');
          }
          return ListView(
            children: snapshot.data!.docs
                .map<Widget>(
                  _buildUserListItem,
                )
                .toList(),
          );
        },
      );

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    if (_auth.currentUser!.email != data['email']) {
      return ListTile(
        title: Text(data['email']),
        onTap: () {
          //Go to the chat view,
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => ChatPage(
                receiverUserEmail: data['email'],
                receiverUserID: data['uid'],
              ),
            ),
          );
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
