import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cook_book/models/category.dart';
import '../models/meal.dart';
import 'package:equatable/equatable.dart';
import '../models/category.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationState get initialState => NavigationInitial();

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is AppStarted) {
      print("App Started");
      yield NavigationInitial();
    } else if (event is CatTapped) {
      print("Category Tapped");
      yield NavigateToAllMeals(category: event.category);
    } else if (event is MealTapped) {
      print("Meal Tapped");
      print("${event.meal.mealName}");
      yield NavigateToSingleMeal(meal: event.meal);
    }
  }
}
