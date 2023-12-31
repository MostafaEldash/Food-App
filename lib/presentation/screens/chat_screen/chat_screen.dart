import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sizer/sizer.dart';
import '../../../business_logic/chat_cubit/chat_cubit.dart';
import '../../styles/colors.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = ChatCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 9.h, top: 5.h),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(url: ChatCubit
                    .get(context)
                    .uri),
                onWebViewCreated: (controller) {
                  ChatCubit.get(context).setController(controller);
                },
                onLoadStart: (controller, url) {
                  ChatCubit.get(context).setUri(url!);
                },
                onLoadStop: (controller, url) {
                  ChatCubit.get(context).setUri(url!);
                },
                onProgressChanged: (controller, progress) {
                  ChatCubit.get(context).setProgress(progress);
                },
              ),
              if(state is ChatLoadingState)
              LinearProgressIndicator(
                value: cubit.progress,
                color: lightGreen,
              )
            ],
          );
        },
      ),
    );
  }
}
