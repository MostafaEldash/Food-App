import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:meta/meta.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of<ChatCubit>(context);

  late InAppWebViewController controller;

  setController(InAppWebViewController inAppWebViewController){
    controller=inAppWebViewController;
  }

  Uri uri = Uri.parse('https://tawk.to/chat/64a6bbee94cf5d49dc61ea75/1h4lks7bs');
  setUri(Uri uri){
    this.uri = uri;
  }


  int progress=0;

  setProgress(int progress){
    this.progress=progress;
  }
}
