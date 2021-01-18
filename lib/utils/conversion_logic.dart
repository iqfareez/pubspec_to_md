class Conversion {
  // readme generator
  var baseUrl = 'https://pub.dev/packages/';

  String convertFormattedMd(String input) {
    var trimmedUrl = input.trim(); //remove any unwanted lines
    var splittedUrl = trimmedUrl.split('\n'); //transform into a list
    var output = '';

    //parallel array
    List packageName = [];
    List packageVersion = [];

    for (var item in splittedUrl) {
      var temp = item
          .trim(); //remove any leading or trailing whitespaces in each element
      // https://stackoverflow.com/questions/60402195/flutter-dart-split-string-by-first-occurrence
      int idx = item.indexOf(":");
      packageName.add(item.substring(0, idx).trim());
      packageVersion.add(item.substring(idx + 1).trim());
    }
    for (var item in packageName) {
      var fullUrl = baseUrl + item;
      output = output + fullUrl;
    }

    return output;
    //TODO: need to test
  }
}
