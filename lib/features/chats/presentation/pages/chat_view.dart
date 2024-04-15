part of com.curi.app.chats.pages;

class ChatPage extends StatefulWidget {
  const ChatPage({
    required this.receiverUserEmail,
    required this.receiverUserID,
    super.key,
  });
  final String receiverUserEmail;
  final String receiverUserID;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController chatController = TextEditingController();
  ChatService chatService = ChatService();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> sendMessage() async {
    if (chatController.text.isNotEmpty) {
      await chatService.sendMessage(widget.receiverUserID, chatController.text);
      chatController.clear();
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            widget.receiverUserEmail,
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildMessageList()),
            _buildMessageInput(),
          ],
        ),
      );

  //BuildMessageList

  Widget _buildMessageList() => StreamBuilder<QuerySnapshot<Object?>>(
        stream: chatService.getMessages(
          widget.receiverUserID,
          firebaseAuth.currentUser!.uid,
        ),
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot<Object?>> snapshot,
        ) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error.toString()}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data!.docs.map(_buildMessageItem).toList(),
          );
        },
      );

  //Build Message item

  Widget _buildMessageItem(DocumentSnapshot<Object?> document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    Alignment alignment = (data['senderId'] == firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Column(
        children: <Widget>[
          Text(data['senderEmail']),
          Text(
            data['message'],
          ),
        ],
      ),
    );
  }

  //Build input

  Widget _buildMessageInput() => Row(
        children: <Widget>[
          Expanded(
            child: Input(
              controller: chatController,
              hintText: 'Escribe el mensaje'.tr,
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: Icon(
              Icons.arrow_upward,
              color: Colors.sunset[40],
            ),
          ),
        ],
      );
}
