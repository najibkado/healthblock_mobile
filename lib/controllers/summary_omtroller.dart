// import 'package:get/get.dart';
import 'package:healthblock/models/summary_model.dart';
import 'package:healthblock/services/service.dart';

class SummaryController {
  var isLoading = true;
  Summary summary;

  void fetchSummary() async {
    var response = await Services.summaryRequest();

    if (response != null) {
      summary = response;
      print(summary);
      print(this.isLoading);
      print('---------');
    }
  }
}
