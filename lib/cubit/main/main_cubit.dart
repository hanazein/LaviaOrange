import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hakathon_orange/cubit/main/main_state.dart';
import 'package:hakathon_orange/layout/home_screen/page_all.dart';
import 'package:hakathon_orange/models/Formul_id.dart';
import 'package:hakathon_orange/models/PlantsidModel.dart';
import 'package:hakathon_orange/models/ProductFile.dart';
import 'package:hakathon_orange/models/home/home_model.dart';
import 'package:hakathon_orange/models/login/login.dart';
import 'package:hakathon_orange/models/login/update.dart';
import 'package:hakathon_orange/models/post_comment.dart';
import 'package:hakathon_orange/repo/src/local/cache_helper.dart';
import 'package:hakathon_orange/repo/src/local/cache_keys.dart';
import 'package:hakathon_orange/repo/src/remote/dio_helper.dart';
import 'package:hakathon_orange/repo/src/remote/end_point.dart';
import 'package:hakathon_orange/view/home_page/notifi.dart';
import 'package:hakathon_orange/view/home_page/profile/personal.dart';

import 'package:hakathon_orange/view/posts/posts.dart';

import '../../models/Profile_model.dart';
import '../../models/formul.dart';
import '../../models/home/all_models.dart';


import '../../models/like_model.dart';
import '../../models/login/post_formul.dart';
import '../../view/home_page/scan_page/commen_container/qr.dart';

class MainCubit extends Cubit<MainState> {
  bool isDark = false;

  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);
  dynamic x = 1;
  List<Seed> seedList = [];
  List<Tool> toolList = [];
  List<Plant> plantList = [];
  List<Datum> dataList = [];
  List<Userr> userr = [];
  bool butt = false;
  List<ForumCommentId> commentList = [];

  List<Datumm> formullist = [];

  void changeColor() {
    emit(ChangeModeState());
  }

  int currentIndex = 0;

  void changeItem(int value) {
    currentIndex = value;
    if (value == 0) {
      const Posts();
    } else if (value == 1) {
      Qrr();
    } else if (value == 2) {
      const AllPage();
    } else if (value == 3) {
      const NotificationPage();
    } else if (value == 4) {
      PersonalPage();
    }

    emit(Getchange());
  }

  LoginModel? loginModel;

  void userLogin({
    @required String? email,
    @required String? password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: login, data: {"email": email, "password": password})
        .then((value) async {
      //

      await PreferenceUtils.setString(
          SharedKeys.apiToken, value.data['data']['accessToken']);
      if (kDebugMode) {
        print(
          '${PreferenceUtils.getString(SharedKeys.apiToken)}--------------------------------------');
      }
      getUser();
      GetSeeds();
      //print(loginModel!.data.user.lastName);
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel: loginModel));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(LoginErrorState());
    });
  }

  LoginModel? signModel;

  void SignUp(
      {@required String? email,
      @required String? password,
      @required String? firstName,
      @required String? lastName}) {
    emit(SignLoadingState());
    DioHelper.postData(url: signUp, data: {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName
    }).then((value) {
      //
      print(value.data);
      signModel = LoginModel.fromJson(value.data);
      emit(SignSuccessState(signModel: signModel));
    }).catchError((error) {
      print(error.toString());
      emit(SignErrorState());
    });
  }

  HomeModel? homeModel;

  void GetSeeds() {
    emit(SeedsLoadingState());
    DioHelper.getData(
            url: seedss, token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      value.data['data'].forEach((i) {
        seedList.add(Seed.fromJson(i));
      });
      value.data['data'].forEach((i) {
        toolList.add(Tool.fromJson(i));
      });
      print(seedList.length);
      emit(SeedsSuccessState());
    }).catchError((error) {
      print(error.response.toString());
      emit(SeedsErrorState());
    });
  }

  void GetTools() {
    emit(ToolLoadingState());
    DioHelper.getData(
            url: tools, token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      value.data['data'].forEach((i) {
        toolList.add(Tool.fromJson(i));
      });
      print(toolList[0].name);
      emit(ToolSuccessState());
    }).catchError((error) {
      print(error.response.toString());
      emit(ToolErrorState());
    });
  }

  void GetPLants() {
    emit(PlantsLoadingState());
    DioHelper.getData(
            url: plants, token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      value.data['data'].forEach((i) {
        plantList.add(Plant.fromJson(i));
      });
      print(plantList[1].name);
      emit(PlantsSuccessState());
    }).catchError((error) {
      print(error.response.toString());
      emit(PlantsErrorState());
    });
  }

  void GetAll() {
    emit(AllLoadingState());
    DioHelper.getData(
            url: AllToken,
            token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      value.data['data'].forEach((i) {
        dataList.add(Datum.fromJson(i));
      });
      print(dataList[1].imageUrl);
      emit(AllSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AllErrorState());
    });
  }

  UpdateModel? updateModel;

  void UpdateUser({
    required String email,
    required String firstName,
    required String lastName,
    required String address,
  }) {
    emit(UpdateLoadingState());

    var data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "address": address,
    };

    print(data);
    DioHelper.patchData(
      url: Update,
      data: data,
      // query: {},
    ).then((value) async {
      print(value.data);
      updateModel = UpdateModel.fromJson(value.data);
      emit(UpdateSuccessState(updateModel));
    }).catchError((error) {
      if (error is DioError) {
        print("Update => ${error.response}");
        emit(UpdateErrorState());
      }
      print("Update => ${error}");
    });
  }

  void getUser() {
    emit(LoginLoadingState());
    DioHelper.getData(
            url: Update, token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      print(value);
      PreferenceUtils.setString(
          SharedKeys.apiToken, value.data['data']['accessToken']);

      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel: loginModel));
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }



  void GetFormul() {
    emit(FormualLoadingState());
    DioHelper.getData(
            url: getForums,
            token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      value.data['data'].forEach((i) {
        formullist.add(Datumm.fromJson(i));
      });
      print(formullist.length);
      emit(FormualSuccessState());
    }).catchError((error) {
      print(error.response.toString());
      emit(FormualErrorState());
    });
  }

  FormulPostModel? formulPostModel;

  void FormualPost({
    @required String? title,
    @required String? description,
    @required String? imageBase64,
  }) {
    emit(AddFormualLoadingState());
    DioHelper.postData(
            url: postFormus,
            data: {
              "title": title,
              "description": description,
              "imageBase64": imageBase64
            },
            token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) async {
      //

      formulPostModel = FormulPostModel.fromJson(value.data);
      emit(AddFormualSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddFormualErrorState());
    });
  }

  PostComment? postComment;

  void FormualPostComment({
    @required String? comment,
    @required String? forumId,
  }) {
    emit(AddCommentLoadingState());
    DioHelper.postData(
      url: "/api/v1/forums/$forumId/comment",
      data: {
        "comment": comment,
      },
      token: PreferenceUtils.getString(SharedKeys.apiToken),
    ).then((value) async {
      postComment = PostComment.fromJson(value.data);
      emit(AddCommentSuccessState());
    }).catchError((error) {
      print(error.response.toString());
      emit(AddCommentErrorState());
    });
  }

  void search(String val) {
    dataList = [];
    emit(SearchLoadingState());
    DioHelper.getData(
            url: AllToken,
            token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      value.data['data'].forEach((i) {
        i['name'].toString().contains(val)
            ? dataList.add(Datum.fromJson(i))
            : null;
      });
      emit(SearchSuccessState());
    }).catchError((onError) {
      emit(SearchErrorState());
    });
  }

  void getComment() {
    emit(CommentLoadingState());
    DioHelper.getData(
            url: GetComment,
            token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      print(value.data['data']['ForumComments']);
      value.data['data']['ForumComments'].forEach((i) {
        commentList.add(ForumCommentId.fromJson(i));
      });
      // print(commentList[0].comment);

      emit(CommentSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CommentErrorState());
    });
  }
  List<int> countProduct = [];

  void changeCountIncrement(index) {
    countProduct[index]++;

    emit(ChangeIncrementState());
  }

  void changeCountDecrement(index) {
    countProduct[index]--;

    emit(ChangeDecrementState());
  }

  List<Datum> addToCart = [];

  void addToCartProducts(Datum product) {
    addToCart.add(product);

    emit(AddToCartListState());
  }
  Profile?profile;

  void getProfile() {
    emit(GetProfileLoadingState());
    DioHelper.getData(
        url: Update, token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      print(value);


      profile = Profile.fromJson(value.data);
      emit(GetProfileSuccess(profile));
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorState());
    });
  }
  void searchFormual(String val) {
    formullist=[];
    emit(SearchFormualLoadingState());
    DioHelper.getData(
        url: getForums,
        token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      value.data['data'].forEach((i) {
        i['title'].toString().contains(val)
            ? formullist.add(Datumm.fromJson(i))
            : null;
      });

      emit(SearchFormualSuccessState());
    }).catchError((error) {
      print(error.response.toString());
      emit(SearchFormualErrorState());
    });
  }
  PlanetsModel?planetsModel;
  List <PlanetData> plantdata=[];
  void GetPlantsId({

    @required String? plantId,
  }) {
    emit(PlanetIdLoadingState());
    DioHelper.getData(
      url: "/api/v1/plants/$plantId",
      token: PreferenceUtils.getString(SharedKeys.apiToken),
    ).then((value) async {
      planetsModel = PlanetsModel.fromJson(value.data);
      emit(PlanetIdSuccessState());
    }).catchError((error) {
      print(error.response.toString());
      emit(PlanetIdErrorState());
    });
  }


  List<Plant> addToCartt = [];

  void addToCartPlants(Plant product) {
    addToCartt.add(product);

    emit(AddToCartPlanetListState());
  }
  List<Seed> addToCartt2 = [];

  void addToCartSeeds(Seed product) {
    addToCartt2.add(product);

    emit(AddToCartSeedsListState());
  }
  List<Tool> addToCartt3 = [];

  void addToCartTools(Tool product) {
    addToCartt3.add(product);
    emit(AddToCartToolsListState());
  }
  LikeModel?likeModel;
  void FormualPostLike({

    @required String? forumId,
  }) {
    emit(AddLikeLoadingState());
    DioHelper.postData(
      url: "/api/v1/forums/$forumId/like",

      token: PreferenceUtils.getString(SharedKeys.apiToken), data: {},
    ).then((value) async {
      likeModel = LikeModel.fromJson(value.data);
      emit(AddLikeSuccessState());
    }).catchError((error) {
      print(error.response.toString());
      emit(AddLikeErrorState());
    });
  }
  List<int> countLike= [];

  void changeLikeIncrement(index) {
    countLike[index]++;

    emit(ChangeLikeState());
  }
  List<int> countComments= [];

  void changeCommentIncrement(index) {
    countComments[index]++;

    emit(ChangeCommentState());
  }
  List<UserNotification>userlist=[];
  void getProfileNotify() {
    emit(GetProfileNotifyLoadingState());
    DioHelper.getData(
        url: Update, token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      value.data['data']['UserNotification'].forEach((i) {
        userlist.add(UserNotification.fromJson(i));
      });
      print(userlist.length);

      emit(GetProfileNotifySuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileNotifyErrorState());
    });
  }
  List<PlantBLog> planrbloglist=[];
  void getblogs() {
    emit(GetblogsLoadingState());
    DioHelper.getData(
        url: blogs, token: PreferenceUtils.getString(SharedKeys.apiToken))
        .then((value) {
      value.data['data']['plants'].forEach((i) {
        planrbloglist.add(PlantBLog.fromJson(i));
      });
      print(planrbloglist[1].sunLight);

      emit(GetblogsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetblogsErrorState());
    });
  }
  List<PlanetData>planetdata=[];
  void searchPlanet({
  @required String? plantId,}) {
 plantdata=[];
    emit(GetplantidLoadingState());
    DioHelper.getData(
       url: "/api/v1/plants/$plantId",
        token: PreferenceUtils.getString(SharedKeys.apiToken),)
        .then((value) {
      value.data['data'].forEach((i) {
        i['plantId'].toString().contains(plantId!)
            ? plantdata.add(PlanetData.fromJson(i))
            : null;
      });

      emit(GetplantidSuccessState());
    }).catchError((error) {
      print(error.response.toString());
      emit(GetplantidErrorState());
    });
  }

}
