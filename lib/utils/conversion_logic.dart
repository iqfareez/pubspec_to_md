class Conversion {
  // readme generator
  var baseUrl = 'https://pub.dev/packages/';

  String convertFormattedMd(String input) {
    String fullUrl = '';
    var urls = input;
    var trimmedUrl = urls.trim(); //remove any unwanted lines
    var splittedUrl = trimmedUrl.split('\n'); //transform into a list
    var trimmedUrl2 = [];

    for (var item in splittedUrl) {
      var temp = item.trim();
      trimmedUrl2.add(temp); //add each trimmedUrl into new list
    }

    for (var item in trimmedUrl2) {
      fullUrl = fullUrl + baseUrl + item + '\n';
    }
    print(fullUrl);
    // https://stackoverflow.com/questions/60402195/flutter-dart-split-string-by-first-occurrence
    return fullUrl;
  }

  // void main() {

  // }
}
