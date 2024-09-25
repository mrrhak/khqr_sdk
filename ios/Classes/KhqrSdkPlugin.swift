import BakongKHQR
import Flutter
import UIKit

public class KhqrSdkPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "khqr_sdk", binaryMessenger: registrar.messenger())
    let instance = KhqrSdkPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "generateIndividual":
      self.generateIndividual(call, result)
    case "generateMerchant":
      self.generateMerchant(call, result)
    case "verify":
      self.verify(call, result)
    case "decode":
      self.decode(call, result)
    case "generateDeepLink":
      self.generateDeepLink(call, result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func generateIndividual(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(FlutterError(code: "Missing Parameter", message: "Missing Parameter", details: nil))
      return
    }

    let arguments = call.arguments as! [String: Any?]
    let currency = arguments["currency"] as! String
    let info = IndividualInfo(
      accountId: arguments["bakongAccountId"] as! String,
      merchantName: arguments["merchantName"] as! String,
      accountInformation: arguments["accountInformation"] as? String,
      acquiringBank: arguments["acquiringBank"] as? String,
      currency: currency == "khr" ? .Khr : .Usd,
      amount: arguments["amount"] as! Double
    )
    info?.billNumber = arguments["billNumber"] as? String
    info?.mobileNumber = arguments["mobileNumber"] as? String
    info?.storeLabel = arguments["storeLabel"] as? String
    info?.terminalLabel = arguments["terminalLabel"] as? String
    info?.purposeOfTransaction = arguments["purposeOfTransaction"] as? String
    info?.upiAccountInformation = arguments["upiAccountInformation"] as? String
    info?.merchantAlternateLanguagePreference =
      arguments["merchantAlternateLanguagePreference"] as? String
    info?.merchantNameAlternateLanguage = arguments["merchantNameAlternateLanguage"] as? String
    info?.merchantCity = arguments["merchantCity"] as? String
    info?.merchantCityAlternateLanguage = arguments["merchantCityAlternateLanguage"] as? String

    let khqrResponse = BakongKHQR.generateIndividual(info!)
    if khqrResponse.status?.code == 0 {
      let khqrData = khqrResponse.data as? KHQRData
      result("{\"qr\": \"\(khqrData?.qr ?? "")\", \"md5\": \"\(khqrData?.md5 ?? "")\"}")
    } else {
      result(FlutterError.init(code: "Error", message: khqrResponse.status?.message, details: nil))
    }
  }

  private func generateMerchant(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(FlutterError(code: "Missing Parameter", message: "Missing Parameter", details: nil))
      return
    }

    let arguments = call.arguments as! [String: Any?]
    let currency = arguments["currency"] as! String
    let info = MerchantInfo(
      accountId: arguments["bakongAccountId"] as! String,
      merchantId: arguments["merchantId"] as! String,
      merchantName: arguments["merchantName"] as! String,
      acquiringBank: arguments["acquiringBank"] as! String,
      currency: currency == "khr" ? .Khr : .Usd,
      amount: arguments["amount"] as! Double
    )
    info?.billNumber = arguments["billNumber"] as? String
    info?.mobileNumber = arguments["mobileNumber"] as? String
    info?.storeLabel = arguments["storeLabel"] as? String
    info?.terminalLabel = arguments["terminalLabel"] as? String
    info?.purposeOfTransaction = arguments["purposeOfTransaction"] as? String
    info?.upiAccountInformation = arguments["upiAccountInformation"] as? String
    info?.merchantAlternateLanguagePreference =
      arguments["merchantAlternateLanguagePreference"] as? String
    info?.merchantNameAlternateLanguage = arguments["merchantNameAlternateLanguage"] as? String
    info?.merchantCity = arguments["merchantCity"] as? String
    info?.merchantCityAlternateLanguage = arguments["merchantCityAlternateLanguage"] as? String

    let khqrResponse = BakongKHQR.generateMerchant(info!)
    if khqrResponse.status?.code == 0 {
      let khqrData = khqrResponse.data as? KHQRData
      result("{\"qr\": \"\(khqrData?.qr ?? "")\", \"md5\": \"\(khqrData?.md5 ?? "")\"}")
    } else {
      result(FlutterError.init(code: "Error", message: khqrResponse.status?.message, details: nil))
    }
  }

  private func verify(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(FlutterError(code: "Missing Parameter", message: "Missing Parameter", details: nil))
      return
    }

    let arguments = call.arguments as! [String: Any?]
    let qrCode = arguments["qrCode"] as! String

    let khqrResponse = BakongKHQR.verify(qrCode)
    let crcValidation = khqrResponse?.data as? CRCValidation
    result(crcValidation?.valid ?? false)
  }

  private func decode(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(FlutterError(code: "Missing Parameter", message: "Missing Parameter", details: nil))
      return
    }

    let arguments = call.arguments as! [String: Any?]
    let qrCode = arguments["qrCode"] as! String

    let khqrResponse = BakongKHQR.decode(qrCode)

    if khqrResponse?.status?.code == 0 {
      let decodeData = khqrResponse?.data as! KHQRDecodeData
      if let jsonString = convertObjectToJSONString(object: decodeData) {
        result(jsonString)
      } else {
        result(
          FlutterError.init(code: "Error", message: khqrResponse?.status?.message, details: nil))
      }
    } else {
      result(FlutterError.init(code: "Error", message: khqrResponse?.status?.message, details: nil))
    }
  }

  private func convertObjectToJSONString(object: KHQRDecodeData) -> String? {
    // Get the object's dictionary representation using KVC
    // Add all the properties you want to include
    let keys = [
      "payloadFormatIndicator",
      "pointOfInitiationMethod",
      "merchantType",
      "upiAccountInformation",
      "bakongAccountID",
      "merchantAccountId",
      "accountInformation",
      "acquiringBank",
      "merchantCategoryCode",
      "countryCode",
      "merchantName",
      "merchantCity",
      "transactionCurrency",
      "transactionAmount",
      "billNumber",
      "mobileNumber",
      "storeLabel",
      "terminalLabel",
      "purposeOfTransaction",
      "merchantAlternateLanguagePreference",
      "merchantNameAlternateLanguage",
      "merchantCityAlternateLanguage",
      "timestamp",
      "crc",
    ]
    var dict: [String: Any] = [:]

    for key in keys {
      if let value = object.value(forKey: key) {
        dict[key] = value
      }
    }

    // Convert the dictionary to JSON
    do {
      let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [])
      let jsonString = String(data: jsonData, encoding: .utf8)
      return jsonString
    } catch {
      print("Error serializing object to JSON: \(error)")
      return nil
    }
  }

  private func generateDeepLink(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(FlutterError(code: "Missing Parameter", message: "Missing Parameter", details: nil))
      return
    }

    let arguments = call.arguments as! [String: Any?]
    let qr = arguments["qr"] as! String
    let url = arguments["url"] as! String

    let sourceInfo = SourceInfo()
    if arguments["sourceInfo"] != nil {
      let sourceInfoObj = arguments["sourceInfo"] as! [String: Any?]
      sourceInfo.appName = sourceInfoObj["appName"] as! String
      sourceInfo.appIconURL = sourceInfoObj["appIconUrl"] as! String
      sourceInfo.appDeepLinkCallback = sourceInfoObj["appDeepLinkCallBack"] as! String
    }

    let response = BakongKHQR.generateDeepLink(url, qr: qr, sourceInfo: sourceInfo)

    if response?.status?.code == 0 {
      let deeplinkData = response?.data as? KHQRDeepLinkData
      result("{\"shortLink\": \"\(deeplinkData?.shortLink ?? "")\"}")
    } else {
      result(FlutterError.init(code: "Error", message: response?.status?.message, details: nil))
    }
  }
}
