// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:srs5/profile/bloc/profile_bloc.dart';



// class HomePage extends StatefulWidget {
//   const HomePage ({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();

  
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final postBloc = BlocProvider.of<ProfileBloc>(context);
//     postBloc.FetchProfileEvent();

//     return BlocConsumer<PostCubit, PostState>(
//       listener: (context, state) {
//         if (state is PostError) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(state.message)),
//           );
//         }
//       },
//       builder: (context, state) {
//         if (state is PostLoading) {
//           return Center(child: CircularProgressIndicator());
//         } else if (state is PostLoaded) {
//           return ListView.builder(
//             itemCount: state.posts.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(state.posts[index].title),
//                 subtitle: Text('UserId: ${state.posts[index].userId}\n'
//                     'Id: ${state.posts[index].id}\n'
//                     '${state.posts[index].body}'),
//               );
//             },
//           );
//         }
//         return Container();
// },
// );
// }
// }