# generator readme
import webbrowser

baseUrl = 'https://pub.dev/packages/'

urls = '''font_awesome_flutter
  url_launcher
  cupertino_icons
  auto_size_text
  flutter_neumorphic
  path_provider
  share
  keyboard_avoider
  qr_flutter
  '''


def main():
    trimmedUrl = urls.strip(' ')
    splittedUrls = trimmedUrl.splitlines()
    strippedUrls = [y.strip(' ') for y in splittedUrls]
    print(strippedUrls)

    for item in strippedUrls:
        url = baseUrl + item
        # webbrowser.open(url, new=2)
        print(f'Opening {url}')


if __name__ == "__main__":
    main()
