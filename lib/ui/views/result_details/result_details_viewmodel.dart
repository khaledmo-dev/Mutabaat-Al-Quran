import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/data/models/answer.dart';
import 'package:quran_test/services/result_service.dart';
import 'package:stacked/stacked.dart';

class ResultDetailsViewModel extends FutureViewModel<List<AnswerModel>> {
  final int id;
  ResultDetailsViewModel(this.id);

  final _resultService = locator<ResultService>();

  @override
  Future<List<AnswerModel>> futureToRun() {
    return _resultService.getResultAnswers(id);
  }
}
