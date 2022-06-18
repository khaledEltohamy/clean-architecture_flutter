import 'package:clean/futures/posts/presentation/pages/home_screen.dart';
import 'package:clean/futures/posts/presentation/widgets/errorScreen.dart';
import 'package:clean/futures/posts/presentation/widgets/loadingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../doamin/entites/posts.dart';
import '../bloc/bloc_actions_posts/actions_posts_bloc.dart';

class ActionScreen extends StatefulWidget {
  final Post? post;
  final bool isEdit;
  const ActionScreen({Key? key, this.post, required this.isEdit})
      : super(key: key);

  @override
  State<ActionScreen> createState() => _ActionScreenState();
}

class _ActionScreenState extends State<ActionScreen> {
  final key_form = GlobalKey<FormState>();

  final titleTextEdtiting = TextEditingController();
  final bodyTextEdtiting = TextEditingController();

  @override
  void initState() {
    if (widget.isEdit) {
      titleTextEdtiting.text = widget.post!.title;
      bodyTextEdtiting.text = widget.post!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? "Edit" : "Add"),
      ),
      body: BlocConsumer<ActionsPostsBloc, ActionsPostsState>(
          builder: (c, state) {
        if (state is LoadingActionState) {
          return LoadingScreen();
        }
        return _buildBody();
      }, listener: (c, state) {
        if (state is SuccessActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("${state.msg}"),
            backgroundColor: Colors.green,
          ));
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomeScreen()));
        } else if (state is FaliedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("${state.msg}"),
            backgroundColor: Colors.red,
          ));
        }
      }),
    );
  }

  _buildBody() {
    return Center(
      child: Form(
        key: key_form,
        child: Column(
          children: [
            _buildTextForm(titleTextEdtiting, false),
            _buildTextForm(bodyTextEdtiting, true),
            OutlinedButton.icon(
              onPressed: () => _checkValidateForm(),
              icon: Icon(Icons.save),
              label: Text("SAVE"),
            )
          ],
        ),
      ),
    );
  }

  TextFormField _buildTextForm(
      TextEditingController editingController, bool isBody) {
    return TextFormField(
      controller: editingController,
      minLines: isBody ? 6 : null,
      maxLines: isBody ? 6 : null,
      validator: (input) => input!.isEmpty ? "this field can't be empty" : null,
      decoration: InputDecoration(hintText: isBody ? "Body" : "Title"),
    );
  }

  _checkValidateForm() {
    final isValid = key_form.currentState!.validate();
    if (isValid) {
      if (widget.isEdit) {
        BlocProvider.of<ActionsPostsBloc>(context).add(EditPostEvent(
            post: Post(
                id: widget.post!.id,
                userId: widget.post!.userId,
                title: titleTextEdtiting.text,
                body: bodyTextEdtiting.text)));
      } else {
        BlocProvider.of<ActionsPostsBloc>(context).add(AddPostEvent(
            post: Post(
                title: titleTextEdtiting.text, body: bodyTextEdtiting.text)));
      }
    }
  }
}
