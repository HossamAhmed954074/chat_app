import 'package:bloc/bloc.dart';
import '../../../constraints/strings.dart';
import '../../../data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  CollectionReference messages = FirebaseFirestore.instance.collection(
    KMessage,
  );
  List<MessageModel> list = [];
  void sendMessage({required String message, required String email}) {
    messages.add({KMessage: message, KcreatedAt: DateTime.now(), 'Id': email});
  }

  void resevedMessage() {
    messages.orderBy(KcreatedAt, descending: true).snapshots().listen((event) {
      list.clear();
      for (var doc in event.docs) {
        list.add(MessageModel.fromJson(doc));
      }
      emit(ChatSuccsess());
    });
  }
}
