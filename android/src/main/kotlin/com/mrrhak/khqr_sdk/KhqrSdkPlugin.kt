package com.mrrhak.khqr_sdk

import androidx.annotation.NonNull

import com.google.gson.Gson
import com.google.gson.reflect.TypeToken

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import kh.gov.nbc.bakong_khqr.BakongKHQR
import kh.gov.nbc.bakong_khqr.model.CRCValidation
import kh.gov.nbc.bakong_khqr.model.IndividualInfo
import kh.gov.nbc.bakong_khqr.model.KHQRCurrency
import kh.gov.nbc.bakong_khqr.model.KHQRData
import kh.gov.nbc.bakong_khqr.model.KHQRDecodeData
import kh.gov.nbc.bakong_khqr.model.KHQRDeepLinkData
import kh.gov.nbc.bakong_khqr.model.KHQRResponse
import kh.gov.nbc.bakong_khqr.model.MerchantInfo
import kh.gov.nbc.bakong_khqr.model.SourceInfo

/** KhqrSdkPlugin */
class KhqrSdkPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "khqr_sdk")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "generateIndividual") {
      this.generateIndividual(call, result);
    } else if (call.method == "generateMerchant") {
      this.generateMerchant(call, result);
    } else if (call.method == "verify") {
      this.verify(call, result);
    } else if (call.method == "decode") {
      this.decode(call, result);
    } else if (call.method == "generateDeepLink") {
      this.generateDeepLink(call, result);
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun generateIndividual(call: MethodCall, result: Result) {
    if(call.arguments == null) {
      result.error("GENERATE_INDIVIDUAL_ERROR", "Missing parameter", null)
      return
    }

    val bakongAccountId: String? = call.argument("bakongAccountId")
    val merchantName: String? = call.argument("merchantName")
    val amount: Double? = call.argument("amount")
    val currency: String? = call.argument("currency")
    val accountInformation: String? = call.argument("accountInformation")
    val acquiringBank: String? = call.argument("acquiringBank")
    val merchantCity: String? = call.argument("merchantCity")
    val billNumber: String? = call.argument("billNumber")
    val mobileNumber: String? = call.argument("mobileNumber")
    val storeLabel: String? = call.argument("storeLabel")
    val terminalLabel: String? = call.argument("terminalLabel")
    val upiAccountInformation: String? = call.argument("upiAccountInformation")
    val purposeOfTransaction: String? = call.argument("purposeOfTransaction")
    val merchantAlternateLanguagePreference: String? = call.argument("merchantAlternateLanguagePreference")
    val merchantNameAlternateLanguage: String? = call.argument("merchantNameAlternateLanguage")
    val merchantCityAlternateLanguage: String? = call.argument("merchantCityAlternateLanguage")

    val individualInfo: IndividualInfo = IndividualInfo().apply {
      this.bakongAccountId = bakongAccountId
      this.merchantName = merchantName
      this.amount = amount
      this.currency = if(currency == "khr") KHQRCurrency.KHR else KHQRCurrency.USD
      this.accountInformation = accountInformation
      this.acquiringBank = acquiringBank
      this.merchantCity = merchantCity
      this.billNumber = billNumber
      this.mobileNumber = mobileNumber
      this.storeLabel = storeLabel
      this.terminalLabel = terminalLabel
      this.upiAccountInformation = upiAccountInformation
      this.purposeOfTransaction = purposeOfTransaction
      this.merchantAlternateLanguagePreference = merchantAlternateLanguagePreference
      this.merchantNameAlternateLanguage = merchantNameAlternateLanguage
      this.merchantCityAlternateLanguage = merchantCityAlternateLanguage
    }

    val response: KHQRResponse<KHQRData> = BakongKHQR.generateIndividual(individualInfo)
    if(response.khqrStatus.code == 0) {
      val gson: Gson = Gson()
      val jsonString: String = gson.toJson(response.data)
      result.success(jsonString)
    } else {
      result.error("GENERATE_INDIVIDUAL_ERROR", response.khqrStatus.message, null)
    }
  }

  private fun generateMerchant(call: MethodCall, result: Result) {
    if(call.arguments == null) {
      result.error("GENERATE_MERCHANT_ERROR", "Missing parameter", null)
      return
    }

    val bakongAccountId: String? = call.argument("bakongAccountId")
    val amount: Double? = call.argument("amount")
    val currency: String? = call.argument("currency")
    val acquiringBank: String? = call.argument("acquiringBank")
    val merchantId: String? = call.argument("merchantId")
    val merchantName: String? = call.argument("merchantName")
    val merchantCity: String? = call.argument("merchantCity")
    val billNumber: String? = call.argument("billNumber")
    val mobileNumber: String? = call.argument("mobileNumber")
    val storeLabel: String? = call.argument("storeLabel")
    val terminalLabel: String? = call.argument("terminalLabel")
    val upiAccountInformation: String? = call.argument("upiAccountInformation")
    val purposeOfTransaction: String? = call.argument("purposeOfTransaction")
    val merchantAlternateLanguagePreference: String? = call.argument("merchantAlternateLanguagePreference")
    val merchantNameAlternateLanguage: String? = call.argument("merchantNameAlternateLanguage")
    val merchantCityAlternateLanguage: String? = call.argument("merchantCityAlternateLanguage")

    val merchantInfo: MerchantInfo = MerchantInfo().apply {
      this.bakongAccountId = bakongAccountId
      this.amount = amount
      this.currency = if(currency == "khr") KHQRCurrency.KHR else KHQRCurrency.USD
      this.acquiringBank = acquiringBank
      this.merchantId = merchantId
      this.merchantName = merchantName
      this.merchantCity = merchantCity
      this.billNumber = billNumber
      this.mobileNumber = mobileNumber
      this.storeLabel = storeLabel
      this.terminalLabel = terminalLabel
      this.upiAccountInformation = upiAccountInformation
      this.purposeOfTransaction = purposeOfTransaction
      this.merchantAlternateLanguagePreference = merchantAlternateLanguagePreference
      this.merchantNameAlternateLanguage = merchantNameAlternateLanguage
      this.merchantCityAlternateLanguage = merchantCityAlternateLanguage
    }

    val response: KHQRResponse<KHQRData> = BakongKHQR.generateMerchant(merchantInfo)
    if(response.khqrStatus.code == 0) {
      val gson: Gson = Gson()
      val jsonString: String = gson.toJson(response.data)
      result.success(jsonString)
    } else {
      result.error("GENERATE_MERCHANT_ERROR", response.khqrStatus.message, null)
    }
  }

  private fun verify(call: MethodCall, result: Result) {
    if(call.arguments == null) {
      result.error("VERIFY_ERROR", "Missing parameter", null)
      return
    }

    val qrCode: String? =  call.argument("qrCode")

    val response: KHQRResponse<CRCValidation> = BakongKHQR.verify(qrCode)
    if(response.khqrStatus.code == 0) {
      result.success(response.data.isValid)
    } else {
      result.error("VERIFY_ERROR", response.khqrStatus.message, null)
    }
  }

  private fun decode(call: MethodCall, result: Result) {
    if(call.arguments == null) {
      result.error("DECODE_ERROR", "Missing parameter", null)
      return
    }

    val qrCode: String? =  call.argument("qrCode")

    val response: KHQRResponse<KHQRDecodeData> = BakongKHQR.decode(qrCode)
    val gson: Gson = Gson()
    var jsonString: String = gson.toJson(response.data)
    jsonString = jsonString.replace("\"bakongAccountID\":", "\"bakongAccountId\":")
    result.success(jsonString)
  }

  private fun generateDeepLink(call: MethodCall, result: Result) {
    if(call.arguments == null) {
      result.error("GENERATE_DEEPLINK_ERROR", "Missing parameter", null)
      return
    }

    val url: String? = call.argument("url")
    val qr: String? = call.argument("qr")
    val appName: String? = call.argument("appName")
    val appIconUrl: String? = call.argument("appIconUrl")
    val appDeepLinkCallback: String? = call.argument("appDeepLinkCallBack")

    val sourceInfo: SourceInfo = SourceInfo().apply {
      this.appName = appName
      this.appIconUrl = appIconUrl
      this.appDeepLinkCallback = appDeepLinkCallback
    }

    val response: KHQRResponse<KHQRDeepLinkData> = BakongKHQR.generateDeepLink(url, qr, sourceInfo)
    if(response.khqrStatus.code == 0) {
      val gson: Gson = Gson()
      var jsonString: String = gson.toJson(response.data)
      result.success(jsonString)
    } else {
      result.error("GENERATE_DEEPLINK_ERROR", response.khqrStatus.message, null)
    }
  }
}
