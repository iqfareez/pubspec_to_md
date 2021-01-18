// readme generator

const baseUrl = 'https://pub.dev/packages/';

var urls = '''  
font_awesome_flutter : 99.40.106.56 
  url_launcher : 11.33.201.185 
  cupertino_icons : 14.96.49.214 
     auto_size_text : 253.217.163.175 
  flutter_neumorphic : 115.166.247.30 
  path_provider : 147.52.231.161 
  share : 220.8.167.137 
  keyboard_avoider : 89.140.238.82 
  qr_flutter : 159.17.239.244 

  '''; //imagine ip adddress as version number

void main() {
  var trimmedUrl = urls.trim(); //remove any unwanted lines
  var splittedUrl = trimmedUrl.split('\n'); //transform into a list

  //parallel array
  List packageName = [];
  List packageVersion = [];

  for (var item in splittedUrl) {
    // https://stackoverflow.com/questions/60402195/flutter-dart-split-string-by-first-occurrence
    int idx = item.indexOf(":");
    packageName.add(item.substring(0, idx).trim());
    packageVersion.add(item.substring(idx + 1).trim());
  }

  //printing parallel array
  // for (var i = 0; i < packageName.length; i++) {
  //   print('${i + 1}: ${packageName[i]} | ${packageVersion[i]}');
  // }

  //Adding link to each url
  //VIEW OPTION 1 (URL ONLY)
  // for (var item in packageName) {
  //   var fullUrl = baseUrl + item;
  //   print(fullUrl);
  // }

  //VIEW OPTION 2 (URL & VERSION)
  for (var i = 0; i < packageName.length; i++) {
    var fullUrl = baseUrl + packageName[i];
    var output = fullUrl + ' (Version: ${packageVersion[i]})';
    print(output);
  }
  print('\n');
}
