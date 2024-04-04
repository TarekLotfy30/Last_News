import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:last_news/model/category_card_model.dart';
import 'package:last_news/model/news_model.dart';
import 'package:last_news/view_model/data/remote/constants/const.dart';
import 'package:last_news/view_model/data/remote/constants/endpoints.dart';
import 'package:last_news/view_model/data/remote/dio_helper.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  final TextEditingController searchController = TextEditingController();

  NewsModel? searchNewsModel;
  NewsModel? breakingNewsModel;
  NewsModel? categoryNewsModel;

  bool isArabic = false;
  void changeLanguage(bool value) {
    isArabic = value;
    emit(ChangeLanguageState());
  }

  Future<void> getBreakingNewsData() async {
    emit(BreakingNewsDataLoadingState());
    await DioHelper.get(
      endPoint: EndPoints.topHeadlines,
      params: {
        'country': isArabic ? 'eg' : 'us',
        'apiKey': Const.apiKey,
      },
    ).then((value) {
      breakingNewsModel = NewsModel.fromJson(value?.data);
      emit(BreakingNewsDataSuccessState());
    }).catchError((onError) {
      emit(BreakingNewsDataErrorState(onError.toString()));
    });
  }

  Future<void> search({required String text}) async {
    emit(SearchLoadingState());
    await DioHelper.get(
      endPoint: EndPoints.everything,
      params: {
        'q': text,
        'apiKey': Const.apiKey,
      },
    ).then((value) {
      searchNewsModel = NewsModel.fromJson(value?.data);
      emit(SearchDataSuccessState());
    }).catchError((onError) {
      emit(SearchDataErrorState(onError.toString()));
    });
  }

  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndex());
  }

  Future<void> getSelectedCategoryNewsData() async {
    emit(GetSelectedCategoryLoadingState());
    await DioHelper.get(
      endPoint: EndPoints.topHeadlines,
      params: {
        'country': isArabic ? 'eg' : 'us',
        "category": _categoryList[currentIndex].title.toLowerCase(),
        'apiKey': Const.apiKey,
      },
    ).then((value) {
      categoryNewsModel = NewsModel.fromJson(value?.data);
      emit(GetSelectedCategoryDataSuccessState());
    }).catchError((error) {
      emit(GetSelectedCategoryDataErrorState(error.toString()));
    });
  }

  // List of categories
  final List<CategoryCardModel> _categoryList = [
    CategoryCardModel(
      title: 'Technology',
      icon: 'assets/svgs/icons/home_screen_icons/categories/technology.svg',
    ),
    CategoryCardModel(
      title: 'Sports',
      icon: 'assets/svgs/icons/home_screen_icons/categories/sports1.svg',
    ),
    CategoryCardModel(
      title: 'Business',
      icon: 'assets/svgs/icons/home_screen_icons/categories/bussiness.svg',
    ),
    CategoryCardModel(
      title: 'Entertainment',
      icon: 'assets/svgs/icons/home_screen_icons/categories/entertainment.svg',
    ),
    CategoryCardModel(
      title: 'Health',
      icon: 'assets/svgs/icons/home_screen_icons/categories/health.svg',
    ),
    CategoryCardModel(
      title: 'Science',
      icon: 'assets/svgs/icons/home_screen_icons/categories/science.svg',
    ),
  ];

  List<CategoryCardModel> get categoryList => _categoryList;
}
