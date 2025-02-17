import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data_layer/models/Book_model/book_model.dart';
import 'package:meta/meta.dart';

import '../../../data_layer/repo/home_repo.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchNewestBooks() async{
    emit(NewestBooksLoading());
    var result= await homeRepo.fetchNewestBooks();
    result.fold((failure){
      emit(NewestBooksFailure(failure.errMessage));
    }, (books){
      emit(NewestBooksSuccess(books));
    });
  }
}
