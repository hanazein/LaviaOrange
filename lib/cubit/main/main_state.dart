import 'package:hakathon_orange/models/Profile_model.dart';

import 'package:hakathon_orange/models/login/login.dart';
import 'package:hakathon_orange/models/login/update.dart';

class MainState {}

class MainInitial extends MainState {}

class FoundItemSuccess extends MainState {}

class ChangeModeState extends MainState {}

class Getchange extends MainState {}

class LoginSuccessState extends MainState {
  final LoginModel? loginModel;

  LoginSuccessState({this.loginModel});
}

class LoginLoadingState extends MainState {}

class LoginErrorState extends MainState {}

class SignLoadingState extends MainState {}

class SignErrorState extends MainState {}

class SignSuccessState extends MainState {
  final LoginModel? signModel;

  SignSuccessState({this.signModel});
}

class SeedsLoadingState extends MainState {}

class SeedsSuccessState extends MainState {}

class SeedsErrorState extends MainState {}

class UpdateLoadingState extends MainState {}

class UpdateSuccessState extends MainState {
  final UpdateModel? updateModel;

  UpdateSuccessState(this.updateModel);
}

class UpdateErrorState extends MainState {}

class ToolLoadingState extends MainState {}

class ToolSuccessState extends MainState {}

class ToolErrorState extends MainState {}

class PlantsLoadingState extends MainState {}

class PlantsSuccessState extends MainState {}

class PlantsErrorState extends MainState {}

class AllLoadingState extends MainState {}

class AllSuccessState extends MainState {}

class AllErrorState extends MainState {}

class AddSuccessState extends MainState {}

class MinusSuccessState extends MainState {}

class FormualLoadingState extends MainState {}

class FormualSuccessState extends MainState {}

class FormualErrorState extends MainState {}

class AddFormualLoadingState extends MainState {}

class AddFormualSuccessState extends MainState {}

class AddFormualErrorState extends MainState {}

class AddCommentLoadingState extends MainState {}

class AddCommentSuccessState extends MainState {}

class AddCommentErrorState extends MainState {}

class SearchLoadingState extends MainState {}

class SearchSuccessState extends MainState {}

class SearchErrorState extends MainState {}

class CommentLoadingState extends MainState {}

class CommentSuccessState extends MainState {}

class CommentErrorState extends MainState {}



class AddCartSuccess extends MainState {}

class ChangeIncrementState extends MainState {}

class ChangeDecrementState extends MainState {}
class AddToCartListState extends MainState {}
class GetProfileLoadingState extends MainState {}

class GetProfileErrorState extends MainState {}

class GetProfileSuccess extends MainState {
  final Profile? profile;

  GetProfileSuccess(this.profile);


}
class SearchFormualLoadingState extends MainState {}

class SearchFormualSuccessState extends MainState {}

class SearchFormualErrorState extends MainState {}
class PlanetIdLoadingState extends MainState {}

class PlanetIdSuccessState extends MainState {}

class PlanetIdErrorState extends MainState {}
class AddToCartPlanetListState extends MainState {}
class AddToCartSeedsListState extends MainState {}
class AddToCartToolsListState extends MainState {}
class AddLikeLoadingState extends MainState {}

class AddLikeSuccessState extends MainState {}

class AddLikeErrorState extends MainState {}
class ChangeLikeState extends MainState{}
class ChangeCommentState extends MainState{}
class GetProfileNotifySuccess extends MainState{}
class GetProfileNotifyErrorState extends MainState {}
class GetProfileNotifyLoadingState extends MainState {}
class GetblogsSuccessState extends MainState{}
class GetblogsErrorState extends MainState {}
class GetblogsLoadingState extends MainState {}
class GetplantidSuccessState extends MainState{}
class GetplantidErrorState extends MainState {}
class GetplantidLoadingState extends MainState {}