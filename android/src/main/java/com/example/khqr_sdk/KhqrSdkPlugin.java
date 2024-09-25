package com.example.khqr_sdk;

import androidx.annotation.NonNull;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.Map;
import java.util.Objects;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

import kh.gov.nbc.bakong_khqr.BakongKHQR;
import kh.gov.nbc.bakong_khqr.model.CRCValidation;
import kh.gov.nbc.bakong_khqr.model.IndividualInfo;
import kh.gov.nbc.bakong_khqr.model.KHQRCurrency;
import kh.gov.nbc.bakong_khqr.model.KHQRData;
import kh.gov.nbc.bakong_khqr.model.KHQRDecodeData;
import kh.gov.nbc.bakong_khqr.model.KHQRDeepLinkData;
import kh.gov.nbc.bakong_khqr.model.KHQRResponse;
import kh.gov.nbc.bakong_khqr.model.MerchantInfo;
import kh.gov.nbc.bakong_khqr.model.SourceInfo;

/** KhqrSdkPlugin */
public class KhqrSdkPlugin implements FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "khqr_sdk");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if(call.method.equals("generateIndividual")){
      this.generateIndividual(call, result);
    } else if(call.method.equals("generateMerchant")) {
      this.generateMerchant(call, result);
    } else if(call.method.equals("verify")) {
      this.verify(call, result);
    } else if(call.method.equals("decode")) {
      this.decode(call, result);
    } else if(call.method.equals("generateDeepLink")) {
      this.generateDeepLink(call, result);
    } else {
      result.notImplemented();
    }
  }


  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }

  private void generateIndividual(@NonNull MethodCall call, @NonNull Result result){
    if (call.arguments == null) {
      result.error("Missing Parameter", "Missing Parameter", null);
      return;
    }

    Map<String, Object> arguments = (Map<String, Object>) call.arguments;
    String currency = (String) arguments.get("currency");

    IndividualInfo individualInfo = new IndividualInfo();
    individualInfo.setBakongAccountId((String) arguments.get("bakongAccountId"));
    individualInfo.setMerchantName((String) arguments.get("merchantName"));
    individualInfo.setCurrency(Objects.equals(currency, "khr") ? KHQRCurrency.KHR : KHQRCurrency.USD);
    individualInfo.setAmount((Double) arguments.get("amount"));
    if (arguments.get("accountInformation") != null) {
      individualInfo.setAccountInformation((String) arguments.get("accountInformation"));
    }
    if (arguments.get("acquiringBank") != null) {
      individualInfo.setAcquiringBank((String) arguments.get("acquiringBank"));
    }
    if (arguments.get("merchantCity") != null) {
      individualInfo.setMerchantCity((String) arguments.get("merchantCity"));
    }
    if (arguments.get("billNumber") != null) {
      individualInfo.setBillNumber((String) arguments.get("billNumber"));
    }
    if (arguments.get("mobileNumber") != null) {
      individualInfo.setMobileNumber((String) arguments.get("mobileNumber"));
    }
    if (arguments.get("storeLabel") != null) {
      individualInfo.setStoreLabel((String) arguments.get("storeLabel"));
    }
    if (arguments.get("terminalLabel") != null) {
      individualInfo.setTerminalLabel((String) arguments.get("terminalLabel"));
    }
    if (arguments.get("upiAccountInformation") != null) {
      individualInfo.setUpiAccountInformation((String) arguments.get("upiAccountInformation"));
    }
    if (arguments.get("purposeOfTransaction") != null) {
      individualInfo.setPurposeOfTransaction((String) arguments.get("purposeOfTransaction"));
    }
    if (arguments.get("merchantAlternateLanguagePreference") != null) {
      individualInfo.setMerchantAlternateLanguagePreference((String) arguments.get("merchantAlternateLanguagePreference"));
    }
    if (arguments.get("merchantNameAlternateLanguage") != null) {
      individualInfo.setMerchantNameAlternateLanguage((String) arguments.get("merchantNameAlternateLanguage"));
    }
    if (arguments.get("merchantCityAlternateLanguage") != null) {
      individualInfo.setMerchantCityAlternateLanguage((String) arguments.get("merchantCityAlternateLanguage"));
    }

    KHQRResponse<KHQRData> response = BakongKHQR.generateIndividual(individualInfo);
    if (response.getKHQRStatus().getCode() == 0) {
      Gson gson = new Gson();
      String jsonString = gson.toJson(response.getData());
      result.success(jsonString);
    } else {
      result.error("Error", response.getKHQRStatus().getMessage(), null);
    }
  }

  private void generateMerchant(@NonNull MethodCall call, @NonNull Result result){
    if (call.arguments == null) {
      result.error("Missing Parameter", "Missing Parameter", null);
      return;
    }

    Map<String, Object> arguments = (Map<String, Object>) call.arguments;
    String currency = (String) arguments.get("currency");

    MerchantInfo merchantInfo = new MerchantInfo();
    merchantInfo.setBakongAccountId((String) arguments.get("bakongAccountId"));
    merchantInfo.setAcquiringBank((String) arguments.get("acquiringBank"));
    merchantInfo.setMerchantId((String) arguments.get("merchantId"));
    merchantInfo.setMerchantName((String) arguments.get("merchantName"));
    merchantInfo.setCurrency(Objects.equals(currency, "khr") ? KHQRCurrency.KHR : KHQRCurrency.USD);
    merchantInfo.setAmount((Double) arguments.get("amount"));
    if (arguments.get("merchantCity") != null) {
      merchantInfo.setMerchantCity((String) arguments.get("merchantCity"));
    }
    if (arguments.get("billNumber") != null) {
      merchantInfo.setBillNumber((String) arguments.get("billNumber"));
    }
    if (arguments.get("mobileNumber") != null) {
      merchantInfo.setMobileNumber((String) arguments.get("mobileNumber"));
    }
    if (arguments.get("storeLabel") != null) {
      merchantInfo.setStoreLabel((String) arguments.get("storeLabel"));
    }
    if (arguments.get("terminalLabel") != null) {
      merchantInfo.setTerminalLabel((String) arguments.get("terminalLabel"));
    }
    if (arguments.get("purposeOfTransaction") != null) {
      merchantInfo.setPurposeOfTransaction((String) arguments.get("purposeOfTransaction"));
    }
    if (arguments.get("upiAccountInformation") != null) {
      merchantInfo.setUpiAccountInformation((String) arguments.get("upiAccountInformation"));
    }
    if (arguments.get("merchantAlternateLanguagePreference") != null) {
      merchantInfo.setMerchantAlternateLanguagePreference((String) arguments.get("merchantAlternateLanguagePreference"));
    }
    if (arguments.get("merchantNameAlternateLanguage") != null) {
      merchantInfo.setMerchantNameAlternateLanguage((String) arguments.get("merchantNameAlternateLanguage"));
    }
    if (arguments.get("merchantCityAlternateLanguage") != null) {
      merchantInfo.setMerchantCityAlternateLanguage((String) arguments.get("merchantCityAlternateLanguage"));
    }

    KHQRResponse<KHQRData> response = BakongKHQR.generateMerchant(merchantInfo);
    if (response.getKHQRStatus().getCode() == 0) {
      Gson gson = new Gson();
      String jsonString = gson.toJson(response.getData());
      result.success(jsonString);
    } else {
      result.error("Error", response.getKHQRStatus().getMessage(), null);
    }
  }

  private void verify(@NonNull MethodCall call, @NonNull Result result){
    if (call.arguments == null) {
      result.error("Missing Parameter", "Missing Parameter", null);
      return;
    }

    Map<String, Object> arguments = (Map<String, Object>) call.arguments;
    String qrCode = (String) arguments.get("qrCode");

    KHQRResponse<CRCValidation> response = BakongKHQR.verify(qrCode);
    result.success(response.getData().isValid());
  }

  private void decode(@NonNull MethodCall call, @NonNull Result result){
    if (call.arguments == null) {
      result.error("Missing Parameter", "Missing Parameter", null);
      return;
    }

    Map<String, Object> arguments = (Map<String, Object>) call.arguments;
    String qrCode = (String) arguments.get("qrCode");

    KHQRResponse<KHQRDecodeData> response = BakongKHQR.decode(qrCode);
    System.out.println(response);
    if (response.getKHQRStatus().getCode() == 0) {
      Gson gson = new Gson();
      String jsonString = gson.toJson(response.getData());
      result.success(jsonString);
    } else {
      result.error("Error", response.getKHQRStatus().getMessage(), null);
    }
  }

  private void generateDeepLink(@NonNull MethodCall call, @NonNull Result result){
    if (call.arguments == null) {
      result.error("Missing Parameter", "Missing Parameter", null);
      return;
    }

    Map<String, Object> arguments = (Map<String, Object>) call.arguments;
    String qr = (String) arguments.get("qr");
    String url = (String) arguments.get("url");

    SourceInfo sourceInfo = new SourceInfo();

    Object sourceInfoObj = arguments.get("sourceInfo");
    if(sourceInfoObj != null){
      Type type = new TypeToken<Map<String, Object>>(){}.getType();
      Gson gson = new Gson();
      Map<String, Object> sourceInfoMap = gson.fromJson(gson.toJson(sourceInfoObj), type);

      sourceInfo.setAppName((String) sourceInfoMap.get("appName"));
      sourceInfo.setAppIconUrl((String) sourceInfoMap.get("appIconUrl"));
      sourceInfo.setAppDeepLinkCallback((String) sourceInfoMap.get("appDeepLinkCallBack"));
    }

    KHQRResponse<KHQRDeepLinkData> response = BakongKHQR.generateDeepLink(url, qr, sourceInfo);

    if (response.getKHQRStatus().getCode() == 0) {
      Gson gson = new Gson();
      String jsonString = gson.toJson(response.getData());
      result.success(jsonString);
    } else {
      result.error("Error", response.getKHQRStatus().getMessage(), null);
    }
  }
}
