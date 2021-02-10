import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Google Maps API
    GMSServices.provideAPIKey("AIzaSyDkW3r2z0SAGgSdMgatvABALUmM1GgLIy0")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
