import 'package:quran_test/app/app.locator.dart';
import 'package:quran_test/app/app.router.dart';
import 'package:quran_test/data/database.dart';
import 'package:quran_test/services/localization_service.dart';
import 'package:quran_test/services/test_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TestViewModel extends FutureViewModel {
  final List<int> range;
  TestViewModel(this.range);

  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  final _testService = locator<TestService>();

  final List<AnswersCompanion> answers = [];

  bool isNameShown = false;

  bool canPop = false;

  showName() {
    isNameShown = true;
    rebuildUi();
  }

  List<Ayah> ayat = [];

  Future getQuestion() async {
    ayat = await _testService.getQuestion(range);

    isNameShown = false;
    rebuildUi();
  }

  confirmLeave() async {
    var value = await _dialogService.showConfirmationDialog(
      barrierDismissible: true,
      title: 'confirm_leave_page_message'.translate(),
      cancelTitle: 'leave'.translate(),
      confirmationTitle: "cancel".translate(),
    );
    if (value?.confirmed != null) {
      if (value!.confirmed) {
        // await finishTest();
      } else {
        _navigationService.back();
      }
    }
  }

  selectAnswer(bool isCorrect) async {
    answers.add(
      AnswersCompanion.insert(
        isCorrect: isCorrect,
        fromAyah: ayat.first.id,
        toAyah: ayat.last.id,
        resultId: 0,
      ),
    );
    await getQuestion();
  }

  finishTest() async {
    if (answers.isEmpty) {
      _navigationService.back();
      return;
    }
    var resultID = await _testService.recordTestResult(resultAnwers: answers);
    var response = await _dialogService.showConfirmationDialog(
      barrierDismissible: true,
      title:
          "${'you_scored'.translate()} ${answers.where((a) => a.isCorrect.value).length}/${answers.length} ",
      confirmationTitle: "show_results".translate(),
      cancelTitle: 'leave'.translate(),
    );
    if (response?.confirmed == true) {
      _navigationService.replaceWithResultDetailsView(id: resultID);
    } else {
      _navigationService.back();
    }
  }

  @override
  Future futureToRun() async {
    await getQuestion();
  }
}
