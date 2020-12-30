// readme generator

const baseUrl = 'https://pub.dev/packages/';
var urls = '''  font_awesome_flutter
  url_launcher
  cupertino_icons
  auto_size_text
  flutter_neumorphic
  path_provider
  share
  keyboard_avoider
  qr_flutter

  '''; //can make as an input

void main() {
  var trimmedUrl = urls.trim(); //remove any unwanted lines
  var splittedUrl = trimmedUrl.split('\n'); //transform into a list
  var trimmedUrl2 = [];

  for (var item in splittedUrl) {
    var temp = item.trim();
    trimmedUrl2.add(temp); //add each trimmedUrl into new list
  }

  for (var item in trimmedUrl2) {
    var fullUrl = baseUrl + item;
    print(fullUrl);
  }
}
