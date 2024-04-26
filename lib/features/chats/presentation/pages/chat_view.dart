part of com.curi.app.chats.pages;

class ChatPage extends StatefulWidget {
  const ChatPage({
    required this.receiverUserEmail,
    required this.receiverUserID,
    required this.tutorModel,
    super.key,
  });
  final String receiverUserEmail;
  final String receiverUserID;
  final TutorModel tutorModel;

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
          backgroundColor: Colors.jelly[40],
          title: Text(
            widget.tutorModel.name,
            style: TextStyle(color: Colors.white[0]),
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
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: WarningMessage(
                isError: true,
                message: 'Error: ${snapshot.error.toString()}',
                padding: 0,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitRotatingCircle(
              color: Colors.sunset[20],
              size: 50,
            );
          }
          return ListView(
            children: snapshot.data!.docs.map(_buildMessageItem).toList(),
          );
        },
      );

  //Build Message item

  Widget _buildMessageItem(
    DocumentSnapshot<Object?> document,
  ) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    Alignment alignment = (data['senderId'] == firebaseAuth.currentUser!.uid)
        ? Alignment.centerRight
        : Alignment.centerLeft;
    Color colorBubble = (data['senderId'] == firebaseAuth.currentUser!.uid)
        ? Colors.jelly[10]!
        : Colors.sunset[5]!;

    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorBubble,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                crossAxisAlignment:
                    (data['senderId'] == firebaseAuth.currentUser!.uid)
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 4,
                  ),
                  if (data['senderId'] != firebaseAuth.currentUser!.uid)
                    Text(
                      // firebaseAuth.currentUser
                      widget.tutorModel.name,
                      style: TextStyle(
                        color:
                            (data['senderId'] == firebaseAuth.currentUser!.uid)
                                ? Colors.white[0]!
                                : Colors.black[0]!,
                      ),
                    ),
                  Text(
                    data['message'],
                    style: TextStyle(
                      color: (data['senderId'] == firebaseAuth.currentUser!.uid)
                          ? Colors.white[0]!
                          : Colors.black[0]!,
                    ),
                    textAlign:
                        (data['senderId'] == firebaseAuth.currentUser!.uid)
                            ? TextAlign.start
                            : TextAlign.end,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
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
