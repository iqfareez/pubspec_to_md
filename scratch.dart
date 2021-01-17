// readme generator

const baseUrl = 'https://pub.dev/packages/';
var urls = '''  font_awesome_flutter : 150.70.125.246
  url_launcher : 150.70.125.246 
  cupertino_icons : 113.18.129.172
  auto_size_text : 184.133.215.213
  flutter_neumorphic : 125.92.244.104
  path_provider : 195.238.41.151
  share : 69.86.200.216
  keyboard_avoider : 112.125.85.112
  qr_flutter : 171.249.1.103 

  '''; //imagine ip adddress as version number

void main() {
  var trimmedUrl = urls.trim(); //remove any unwanted lines
  var splittedUrl = trimmedUrl.split('\n'); //transform into a list
  var trimmedUrl2 = [];

  //parallel array
  List packageName = [];
  List packageVersion = [];

  for (var item in splittedUrl) {
    var temp = item
        .trim(); //remove any leading or trailing whitespaces in each element
    // https://stackoverflow.com/questions/60402195/flutter-dart-split-string-by-first-occurrence
    int idx = item.indexOf(":");
    // print(idx);
    packageName.add(item.substring(0, idx).trim());
    packageVersion.add(item.substring(idx + 1).trim());

    // trimmedUrl2.add(temp); //add each trimmedUrl into new list
  }

  //printing parallel array
  for (var i = 0; i < packageName.length; i++) {
    print(i + 1);
    //TODO: test by printing each element in paralle array
    print('\n');
  }

  // for (var item in trimmedUrl2) {
  //   var fullUrl = baseUrl + item;
  //   // print(fullUrl);
  // }
}
