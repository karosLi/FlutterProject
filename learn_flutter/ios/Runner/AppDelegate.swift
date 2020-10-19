import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    // 获取 FlutterViewController
    let controller: FlutterViewController = window.rootViewController as! FlutterViewController;
    
    // 创建 channel
    let channel = FlutterMethodChannel(name: "com.kk", binaryMessenger: controller.binaryMessenger);
    
    // 监听方法调用
    channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
        guard call.method == "getBatteryLevel" else {
            result(FlutterMethodNotImplemented);
            return;
        }
        
        let device = UIDevice.current;
        device.isBatteryMonitoringEnabled = true;
        
        if device.batteryState == UIDevice.BatteryState.unknown {
            result(999);
//            result(FlutterError(code: "unknown", message: "Battery state is unknown", details: nil));
            return;
        } else {
            result(Int(device.batteryLevel * 100));
        }
    };
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  
}
