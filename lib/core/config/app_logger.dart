
class AppLogger {
  void localLogWriter(String text, {bool isError = false}) {
    // pass the message to your favorite logging package here
    // please note that even if enableLog: false log messages will be pushed in this callback
    // you get check the flag if you want through GetConfig.isLogEnable
  }
}
