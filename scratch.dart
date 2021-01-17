// readme generator

const baseUrl = 'https://pub.dev/packages/';
//TODO: Buat video recording
var urls = '''  font_awesome_flutter : 
  url_launcher : 
  cupertino_icons : 
  auto_size_text : 
  flutter_neumorphic : 
  path_provider : 
  share : 
  keyboard_avoider : 
  qr_flutter : 

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
    print('${i + 1}: ${packageName[i]} | ${packageVersion[i]}');
    //TODO: test by printing each element in paralle array

  }
  print('\n');

  // for (var item in trimmedUrl2) {
  //   var fullUrl = baseUrl + item;
  //   // print(fullUrl);
  // }
}
