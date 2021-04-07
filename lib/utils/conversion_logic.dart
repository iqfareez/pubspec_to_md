import 'enums.dart';

class Conversion {
  // readme generator
  // i think only me can understand this code hsshhshh
  var baseUrl = 'https://pub.dev/packages/';

  String convertFormattedMd(
      String input, FormatType formatType, int withVersion) {
    var trimmedUrl = input.trim(); //remove any unwanted lines
    var splittedUrl = trimmedUrl.split('\n'); //transform into a list
    var output = '';

    bool isWithVersion = withVersion == 0 ? false : true;

    //parallel array
    List packageName = [];
    List packageVersion = [];

    for (var item in splittedUrl) {
      // https://stackoverflow.com/questions/60402195/flutter-dart-split-string-by-first-occurrence
      int idx = item.indexOf(":");
      packageName.add(item.substring(0, idx).trim());
      packageVersion.add(item.substring(idx + 1).trim());
    }

    switch (formatType) {
      case FormatType.url:
        for (int i = 0; i < packageName.length; i++) {
          var fullUrl = baseUrl + packageName[i];
          output = output + fullUrl;
          output = isWithVersion
              ? output + ' **(' + packageVersion[i] + ')**' + '\n\n'
              : output + '\n\n';
        }
        return output.trim(); //trim to remove extra line
        break;
      case FormatType.name:
        for (int i = 0; i < packageName.length; i++) {
          var fullUrl = baseUrl + packageName[i];

          output = output + '[' + packageName[i] + ']' + '(' + fullUrl + ')';
          output = isWithVersion
              ? output + ' (' + packageVersion[i] + ')' + '\n\n'
              : output + '\n\n';
        }
        return output.trim();
        break;
      case FormatType.table:
        output = '|Name|Link|';
        output = output +
            (isWithVersion
                ? 'Version|\n|----|----|-------|\n'
                : '\n|----|----|\n');

        for (int i = 0; i < packageName.length; i++) {
          var fullUrl = baseUrl + packageName[i];

          output = output + '|' + packageName[i] + '|' + fullUrl + '|';
          output = isWithVersion
              ? output + packageVersion[i] + '|' + '\n'
              : output + '\n';
        }
        return output.trim();

      default:
        return 'oops';
    }
  }
}
