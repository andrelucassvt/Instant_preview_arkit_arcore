import Flutter
import QuickLook
import UIKit
import ARKit

public class SwiftInstantPreviewArkitArcorePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "instant_preview_arkit_arcore", binaryMessenger: registrar.messenger())
    let instance = SwiftInstantPreviewArkitArcorePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if (call.method == "showPreviewArLocal") {
          if let path = call.arguments as? String{
              if let rootViewController = topViewController() {
                  let arQuickLook = ARQLViewController(assetName: path)
                  rootViewController.present(arQuickLook, animated: true)
                  rootViewController.dismiss(animated: true,completion: nil)
                  result(true)
              }
          }
      }

  }
  private func topViewController() -> UIViewController? {
      let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first

      if var topController = keyWindow?.rootViewController {
        while let presentedViewController = topController.presentedViewController {
            topController = presentedViewController
          }
        return topController
      }
      return nil
    }
}
class ARQLViewController: UIViewController, QLPreviewControllerDataSource {
    var assetName: String
    let assetType = "usdz"
    let allowsContentScaling = true
    let canonicalWebPageURL = URL(string: "https://github.com/andrelucassvt")

    init(assetName: String) {
        self.assetName = assetName
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true, completion: nil)
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        print(assetName)
        guard let path = Bundle.main.path(forResource: assetName, ofType: assetType) else {
            fatalError("Couldn't find the supported asset file.")
        }
        let url = URL(fileURLWithPath: path)
        let previewItem = ARQuickLookPreviewItem(fileAt: url)
        previewItem.allowsContentScaling = allowsContentScaling // default = true
        previewItem.canonicalWebPageURL = canonicalWebPageURL   // default = nil
        return previewItem
    }
}
