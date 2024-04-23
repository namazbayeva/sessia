import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:srs5/profile/bloc/profile_bloc.dart';
import 'package:srs5/profile/resources/profile_provider.dart';

class ProfileUserRepository {
  final _provider = ProfileProvider();
  Future<void> fetchProfileData(FetchProfileEvent event, Emitter<ProfileState> emit) async {
    final fetchedProfile = await _provider.fetchProfile();
   emit(LoadedProfileState(fetchedProfile));
   
  }
}