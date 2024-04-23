import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srs5/model/profile_user.dart';
import 'package:srs5/profile/bloc/profile_bloc.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  late ProfileBloc profileBloc;
  List<ProfileUser> profileUserList = [];

  @override
  void initState() {
    profileBloc = ProfileBloc();
    profileBloc.add(FetchProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: profileBloc,
        builder: (context, state) {
          if (state is LoadingProfileState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (state is LoadedProfileState) {
            profileUserList = state.profileUser;
            return buildBody();
          }
          return Container();
        },
      ),
    );
  }

  Widget buildBody() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: profileUserList.length,
        itemBuilder: (BuildContext context, int index) {
          final profileUser = profileUserList[index];
          return ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ID: ${profileUser.id}"),
    Text("User ID: ${profileUser.userId}"),
    Text("Title: ${profileUser.title}"),
    Text("Body: ${profileUser.body}"),
    Divider(
      thickness: 5, 
      color: Colors.red, 
    )
              ],
            ),
          );
        },
      ),
    );
  }
}
