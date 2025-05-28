import 'package:bloc/bloc.dart';
import 'package:flutter_app/bloc/movie/movie_event.dart';
import 'package:flutter_app/bloc/movie/movie_state.dart';
import 'package:flutter_app/common_widget/dialogs/global_error_dialog.dart';
import 'package:flutter_app/framework/enum/app_enum.dart';
import 'package:flutter_app/framework/infrastructure/log/logger_service.dart';
import 'package:flutter_app/framework/services/api_service.dart';
import 'package:flutter_app/framework/services/app_session_service.dart';
import 'package:flutter_app/models/app_exception.dart';
import 'package:flutter/foundation.dart';

@immutable
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(AppSessionService sessionService, ApiService apiService,
      LoggerService loggerService)
      : super(MovieStateNotInitialized(isLoading: true, exception: null)) {
    // onload movie
    on<MovieEventInitialized>((event, state) async {
      try {
        final user = await sessionService.getUserLoggedInModel();
        if (user == null) {
          return emit(MovieStateNotInitialized(
              isLoading: false,
              exception: NotAbleToInitializeMovieException()));
        }

//  movie get api
        final movieResult = await apiService.getMovies(
          companyId: user.companyId,
          sortAscending: true,
          withDetails: true,
        );

        if (movieResult.result == null) {
          loggerService.writeLog(
              "getMovies: no data found", LogMessageLevel.info);
          showGlobalErrorDialog(
              title: "ERROR", content: "Unable to get movies");

          return emit(MovieStateNotInitialized(
              isLoading: false,
              exception: NotAbleToInitializeMovieException()));
        } else if (!movieResult.success) {
          loggerService.writeLog(
              "getMovies: no data found - ${movieResult.errorMsg}",
              LogMessageLevel.error);
          showGlobalErrorDialog(
              title: "ERROR",
              content: "No movies data found: ${movieResult.errorMsg}");

          return emit(MovieStateNotInitialized(
              isLoading: false,
              exception: NotAbleToInitializeMovieException()));
        }

        final movieList = movieResult.result?.model;

        if (movieList == null || movieList.isEmpty) {
          return emit(MovieStateNotInitialized(
              isLoading: false,
              exception: NotAbleToInitializeMovieException()));
        }

        // emit state
        return emit(
            MovieStateInitialized(isLoading: false, movieListModel: movieList));
      } catch (error, stackTrace) {
        loggerService.writeLog("getMovies: no data found",
            LogMessageLevel.error, error, stackTrace);
        showGlobalErrorDialog(title: "ERROR", content: "Unable to get movies");
        return emit(MovieStateNotInitialized(
            isLoading: false, exception: NotAbleToInitializeMovieException()));
      }
    });

    // movie selection event
    on<MovieEventMovieSelected>((event, state) async {
      try {
        // assign the selected movie
        final selectedMovie = event.movieModel;
        final user = event.userModel;
        if (selectedMovie == null || user == null) {
          loggerService.writeLog(
              "Unable to select a movie", LogMessageLevel.error);
          showGlobalErrorDialog(
              title: "Error", content: "Unable to select a movie");
          return emit(MovieStateNotInitialized(
              isLoading: false,
              exception: NotAbleToInitializeMovieException()));
        }

        final movieResult = await apiService.getMovie(
          id: selectedMovie.movieId,
        );

        if (movieResult == null) {
          loggerService.writeLog(
              "getMovies: no data found", LogMessageLevel.info);
          showGlobalErrorDialog(
              title: "Error", content: "Unable to get movies");

          return emit(MovieStateMovieSelected(
              isLoading: false,
              movieModel: event.movieModel,
              movieListModel: event.movieListModel,
              userModel: user));
        } else if (!movieResult.success) {
          loggerService.writeLog(
              "getMovies: no data found - ${movieResult.errorMsg}",
              LogMessageLevel.error);
          showGlobalErrorDialog(
              title: "Error",
              content: "No movies data found: ${movieResult.errorMsg}");

          return emit(MovieStateMovieSelected(
              isLoading: false,
              movieModel: event.movieModel,
              movieListModel: event.movieListModel,
              userModel: user));
        }

        emit(MovieStateMovieSelected(
            isLoading: true,
            movieModel: movieResult.result?.model,
            movieListModel: event.movieListModel,
            userModel: user));

        if (event.refreshMovieList == true) {
          final movieListDataResult = await apiService.getMovies(
            companyId: user.companyId,
            sortAscending: true,
            withDetails: true,
          );

          if (movieListDataResult.result == null) {
            loggerService.writeLog(
                "getMovies: no data found", LogMessageLevel.info);
            showGlobalErrorDialog(
                title: "ERROR", content: "Unable to get movies");

            return emit(MovieStateMovieSelected(
                isLoading: false,
                movieModel: movieResult.result?.model,
                movieListModel: event.movieListModel,
                userModel: user));
          } else if (!movieListDataResult.success) {
            loggerService.writeLog(
                "getMovies: no data found - ${movieListDataResult.errorMsg}",
                LogMessageLevel.error);
            showGlobalErrorDialog(
                title: "ERROR",
                content:
                    "Unable to fetch movie list: ${movieListDataResult.errorMsg}");
            return emit(MovieStateMovieSelected(
                isLoading: false,
                movieModel: movieResult.result?.model,
                movieListModel: event.movieListModel,
                userModel: user));
          }

          final movieList = movieListDataResult.result?.model;
          // emit state
          return emit(MovieStateMovieSelected(
              isLoading: false,
              movieModel: movieResult.result?.model,
              movieListModel: movieList,
              userModel: user));
        } else {
          // emit state
          return emit(MovieStateMovieSelected(
              isLoading: false,
              movieModel: movieResult.result?.model,
              movieListModel: event.movieListModel,
              userModel: user));
        }
      } catch (error, stackTrace) {
        loggerService.writeLog(
            "No movies data found", LogMessageLevel.error, error, stackTrace);
        showGlobalErrorDialog(title: "ERROR", content: "No movies data found");
        return emit(MovieStateNotInitialized(
            isLoading: false, exception: NotAbleToInitializeMovieException()));
      }
    });

    on<MovieResetEvent>((event, state) {
      return emit(MovieStateNotInitialized(isLoading: true, exception: null));
    });
  }
}
