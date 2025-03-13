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
    case "decodeNonKhqr":
      self.decodeNonKhqr(call, result)
    case "generateDeepLink":
      self.generateDeepLink(call, result)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func generateIndividual(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(
        FlutterError(code: "GENERATE_INDIVIDUAL_ERROR", message: "Missing Parameter", details: nil))
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
    if let expirationTimestamp = arguments["expirationTimestamp"] as? Int {
      info?.expirationTimestamp = NSNumber(value: expirationTimestamp)
    }

    let response = BakongKHQR.generateIndividual(info!)
    if response.status?.code == 0 {
      let khqrData = response.data as? KHQRData
      result("{\"qr\": \"\(khqrData?.qr ?? "")\", \"md5\": \"\(khqrData?.md5 ?? "")\"}")
    } else {
      result(
        FlutterError(
          code: "GENERATE_INDIVIDUAL_ERROR", message: response.status?.message, details: nil))
    }
  }

  private func generateMerchant(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(
        FlutterError(code: "GENERATE_MERCHANT_ERROR", message: "Missing Parameter", details: nil))
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
    if let expirationTimestamp = arguments["expirationTimestamp"] as? Int {
      info?.expirationTimestamp = NSNumber(value: expirationTimestamp)
    }

    let response = BakongKHQR.generateMerchant(info!)
    if response.status?.code == 0 {
      let khqrData = response.data as? KHQRData
      result("{\"qr\": \"\(khqrData?.qr ?? "")\", \"md5\": \"\(khqrData?.md5 ?? "")\"}")
    } else {
      result(
        FlutterError(
          code: "GENERATE_MERCHANT_ERROR", message: response.status?.message, details: nil))
    }
  }

  private func verify(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(FlutterError(code: "VERIFY_ERROR", message: "Missing Parameter", details: nil))
      return
    }

    let arguments = call.arguments as! [String: Any?]
    let qrCode = arguments["qrCode"] as! String

    let response = BakongKHQR.verify(qrCode)
    if response?.status?.code == 0 {
      let crcValidation = response?.data as? CRCValidation
      result(crcValidation?.valid ?? false)
    } else {
      result(FlutterError(code: "VERIFY_ERROR", message: response?.status?.message, details: nil))
    }
  }

  private func decode(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(FlutterError(code: "DECODE_ERROR", message: "Missing Parameter", details: nil))
      return
    }

    let arguments = call.arguments as! [String: Any?]
    let qrCode = arguments["qrCode"] as! String

    if qrCode.count < 2 {
      result(
        FlutterError(code: "DECODE_ERROR", message: "KHQR provided is invalid", details: nil))
      return
    }

    let response = BakongKHQR.decode(qrCode)
    // If decode on invalid string this KHQRDecodeData will have all fields with null
    let decodeData = response?.data as! KHQRDecodeData
    let jsonString = convertObjectToJSONString(object: decodeData)
    if jsonString != nil {
      result(jsonString)
    } else {
      result(
        FlutterError(code: "DECODE_ERROR", message: "KHQR provided is invalid", details: nil))
    }
  }

  private func decodeNonKhqr(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(FlutterError(code: "DECODE_ERROR", message: "Missing Parameter", details: nil))
      return
    }

    let arguments = call.arguments as! [String: Any?]
    let qrCode = arguments["qrCode"] as! String

    if qrCode.count < 2 {
      result(
        FlutterError(code: "DECODE_ERROR", message: "Non-KHQR provided is invalid", details: nil))
      return
    }

    let response = BakongKHQR.decodeNonKhqr(qrCode)
    let decodeData = response?.data as? KHQREMVQRData
    result(decodeData)
  }

  private func generateDeepLink(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    if call.arguments == nil {
      result(
        FlutterError(code: "GENERATE_DEEPLINK_ERROR", message: "Missing Parameter", details: nil))
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
      result(
        FlutterError(
          code: "GENERATE_DEEPLINK_ERROR", message: response?.status?.message, details: nil))
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
      "expirationTimestamp",
      "crc",
    ]
    var dict: [String: Any] = [:]

    for key in keys {
      if let value = object.value(forKey: key) {
        var newKey = key
        if newKey == "bakongAccountID" {
          newKey = "bakongAccountId"
        }
        if newKey == "timestamp" {
          newKey = "creationTimestamp"
        }
        dict[newKey] = value
      }
    }

    // Convert the dictionary to JSON
    do {
      let jsonData = try JSONSerialization.data(withJSONObject: dict, options: [])
      let jsonString = String(data: jsonData, encoding: .utf8) ?? "{}"
      return jsonString
    } catch {
      print("Error serializing object to JSON: \(error)")
      return nil
    }
  }
}
