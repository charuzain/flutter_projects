import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  ChatMessages({super.key});

  final loggedInUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('created at', descending: true)
          .snapshots(),
      builder: (ctx, snapshot) {
        // if connection state is  waiting display loading spinner
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData) {
          return const Text("NO  DATA FOUND!!");
        }
        // if data is there and is empty list , there is no document
        if (snapshot.data!.docs.isEmpty) {
          return const Text("NO  DATA FOUND!!");
        }
        // if some error

        if (snapshot.hasError) {
          return const Center(
            child: Text("Some error occured"),
          );
        }

        return ListView.builder(
            // display message from bottom to top

            reverse: true,
            padding: EdgeInsets.only(bottom: 40, right: 30, left: 30),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (ctx, index) {
              bool isSentByCurrentUser =
                  snapshot.data!.docs[index].data()['userID'] ==
                      loggedInUser!.uid;
              final Color containerColor =
                  isSentByCurrentUser ? Colors.grey : Colors.grey.shade300;

              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment:
                      snapshot.data!.docs[index].data()['userID'] ==
                              loggedInUser!.uid
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                  children: [
                    if (!isSentByCurrentUser)
                      Row(
                        children: [
                          userImage(
                            userImageURL:
                                snapshot.data!.docs[index].data()['userImage'],
                          ),
                          SizedBox(
                            width: 5,
                          )
                        ],
                      ),
                    Column(
                      children: [
                        userName(
                          username:
                              snapshot.data!.docs[index].data()['username'],
                        ),
                        chatMessage(
                          containerColor: containerColor,
                          chatText:
                              snapshot.data!.docs[index].data()['message'],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    if (isSentByCurrentUser)
                      userImage(
                        userImageURL:
                            snapshot.data!.docs[index].data()['userImage'],
                      )
                  ],
                ),
              );
            });
      },
    );
  }
}

class userImage extends StatelessWidget {
  const userImage({super.key, required this.userImageURL});

  final String userImageURL;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      foregroundImage: NetworkImage(userImageURL),
    );
  }
}

class chatMessage extends StatelessWidget {
  const chatMessage(
      {super.key, required this.containerColor, required this.chatText});

  final Color containerColor;
  final String chatText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: containerColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(chatText),
      ),
    );
  }
}

class userName extends StatelessWidget {
  const userName({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Text(
      username,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
