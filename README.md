<div align="center">
  <h1 align="center" style="font-size: 50px;">🍃 KHQR SDK 🍃</h1>
</div>

> [!NOTE]
> This **KHQR SDK** package is not officially release from [**NBC**](https://bakong.nbc.gov.kh/).
> 
> <small>[KHQR SDK Document Reference](https://bakong.nbc.gov.kh/en/download/KHQR/integration/KHQR%20SDK%20Document.pdf)
> </small>
---

<div align="center">
<p align="center">
The standardization of KHQR code specifications will help promote wider use of mobile retail payments in Cambodia and provide consistent user experience for merchants and consumers. It can enable interoperability in the payment industry. A common QR code would facilitate payments among different schemes, e-wallets and banks and would encourage small merchants to adopt KHQR code as payment method. KHQR is created for retail payment in Cambodia and Cross-Border payment within asean countries. It only requires a single QR for receiving payment from any mobile apps including Bakong app, making QR payment simple for both customers and merchants in Cambodia.
</p>
</div>

<div align="center">
   <!--  Donations -->
  <a href="https://ko-fi.com/mrrhak">
    <img width="300" src="https://user-images.githubusercontent.com/26390946/161375567-9e14cd0e-1675-4896-a576-a449b0bcd293.png">
  </a>
  <div align="center">
    <a href="https://www.buymeacoffee.com/mrrhak">
      <img width="150" alt="buy me a coffee" src="https://user-images.githubusercontent.com/26390946/161375563-69c634fd-89d2-45ac-addd-931b03996b34.png">
    </a>
    <a href="https://ko-fi.com/mrrhak">
      <img width="150" alt="Ko-fi" src="https://user-images.githubusercontent.com/26390946/161375565-e7d64410-bbcf-4a28-896b-7514e106478e.png">
    </a>
  </div>
  <!--  Donations -->
</div>

<div align="center">
  <a href="https://pub.dartlang.org/packages/khqr_sdk">
    <img src="https://img.shields.io/pub/v/khqr_sdk?label=Pub&logo=dart"
      alt="Pub Package" />
  </a>
  <a href="https://pub.dev/packages/khqr_sdk">
    <img src="https://img.shields.io/pub/likes/khqr_sdk?style=flat&logo=dart&label=Likes" alt="Pub Likes"/>
  </a>
  <a href="https://pub.dartlang.org/packages/khqr_sdk/score">
    <img src="https://img.shields.io/pub/points/khqr_sdk?label=Score&logo=dart"
      alt="Pub Score" />
  </a>
  <a href="https://pub.dev/packages/khqr_sdk">
    <img alt="Pub Monthly Downloads" src="https://img.shields.io/pub/dm/khqr_sdk?style=flat&color=blue&logo=dart&label=Downloads&link=https%3A%2F%2Fpub.dev%2Fpackages%2Fkhqr_sdk">
  </a>
  <a href="https://github.com/mrrhak/khqr_sdk"><img src="https://img.shields.io/github/stars/mrrhak/khqr_sdk.svg?style=flat&logo=github&colorB=deeppink&label=Stars" alt="Star on Github"></a>
  <a href="https://github.com/mrrhak/khqr_sdk"><img src="https://img.shields.io/github/forks/mrrhak/khqr_sdk?color=orange&label=Forks&logo=github" alt="Forks on Github"></a>
  <a href="https://github.com/mrrhak/khqr_sdk/graphs/contributors">
    <img src="https://img.shields.io/github/contributors/mrrhak/khqr_sdk.svg?style=flat&logo=github&colorB=yellow&label=Contributors"
      alt="Contributors" />
  </a>
  <a href="https://github.com/mrrhak/khqr_sdk/actions?query=workflow%3A">
    <img src="https://github.com/mrrhak/khqr_sdk/actions/workflows/format-analyze-test.yml/badge.svg"
      alt="Build Status" />
  </a>
  <a href="https://github.com/mrrhak/khqr_sdk">
    <img src="https://img.shields.io/github/languages/code-size/mrrhak/khqr_sdk?logo=github&color=blue&label=Size"
      alt="Code size" />
  </a>
  <a href="https://pub.dev/packages/khqr_sdk">
    <img src="https://img.shields.io/badge/Platform-Android%20|%20iOS%20|%20Web%20|%20macOS%20|%20Windows%20|%20Linux%20-blue.svg?logo=flutter"
      alt="Platform" />
  </a>
</div>

---

<p align="center">
  <img src="https://raw.githubusercontent.com/mrrhak/khqr_sdk/refs/heads/master/assets/khqr_sdk_preview.png" width="640" alt="khqr sdk preview"/>
</p>

## Features Supported

| Features             | Android | iOS     | Web     | Windows | macOS   | Linux   |
|----------------------|---------|---------|---------|---------|---------| ------- |
| Generate Individual  |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |
| Generate Merchant    |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |
| Generate Deeplink    |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |
| Verify               |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |
| Decode               |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |
| Decode Non-KHQR      |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |
| Check Bakong Account |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |
| KHQR Card Widget     |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |    ✔    |

## Installation
Run the following command in your Flutter project:
```bash
flutter pub add khqr_sdk
```
> [!TIP]
> Check the [pub.dev page](https://pub.dev/packages/khqr_sdk) for the minimum required Dart/Flutter SDK version.

## Usage
### Import KHQR SDK Package
```dart
import 'package:khqr_sdk/khqr_sdk.dart';
```

### Generate Individual KHQR
```dart
final info = IndividualInfo(
  bakongAccountId: 'kimhak@dev',
  merchantName: 'Kimhak',
  accountInformation: '123456789',
  currency: KhqrCurrency.khr,
  amount: 0,
);
final res = KhqrSdk.generateIndividual(info);
```

### Generate Merchant KHQR
```dart
final info = MerchantInfo(
  bakongAccountId: 'kimhak@dev',
  acquiringBank: 'Dev Bank',
  merchantId: '123456',
  merchantName: 'Kimhak',
  currency: KhqrCurrency.usd,
  amount: 0,
);
final res = KhqrSdk.generateMerchant(info);
```

>[!NOTE] 
>To generate `Dynamic QR` required to set amount more than zero with expiration
>
>```dart
> // 1 hour from now
> final expire = DateTime.now().millisecondsSinceEpoch + 3600000;
> final info = MerchantInfo(
>    bakongAccountId: 'kimhak@dev',
>    acquiringBank: 'Dev Bank',
>    merchantId: '123456',
>    merchantName: 'Kimhak',
>    currency: KhqrCurrency.usd,
>    amount: 100,
>    expirationTimestamp: expire,
> );
> final res = KhqrSdk.generateMerchant(info);
>```


### Verify / Decode / Decode Non-KHQR
```dart
const qrCode = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh9917001317324625358296304B59E';

final verifyRes = KhqrSdk.verify(qrCode);
final decodeRes = KhqrSdk.decode(qrCode);
final decodeNonKhqrRes = KhqrSdk.decodeNonKhqr(qrCode);
```

### Generate KHQR Deeplink
```dart
const qrCode = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh9917001317324625358296304B59E';
final url = 'http://api.example.com/v1/generate_deeplink_by_qr';

final sourceInfo = SourceInfo(
  appName: 'Example App',
  appIconUrl: 'http://cdn.example.com/icons.logo.png',
  appDeepLinkCallBack: 'http://app.example.com/callback',
);

// generateDeepLink and checkBakongAccount are async, call them from an async context
final res = await KhqrSdk.generateDeepLink(url, qrCode, sourceInfo);
```

### Check Bakong Account
```dart
final url = 'https://api-bakong.nbc.gov.kh/v1/check_account_by_id';
final bakongAccount = 'kimhak@dev';
final res = await KhqrSdk.checkBakongAccount(url, bakongAccount);
```

### KHQR Card Widget
```dart
KhqrCardWidget(
  width: 300.0,
  receiverName: 'Kimhak',
  amount: 0.00,
  keepIntegerDecimal: false,
  currency: KhqrCurrency.khr,
  qr: khqrContent,
),
```
> [!TIP]
> `KhqrCardWidget` also supports dynamic QR countdown (`duration`, `onRegenerate`), loading/error overlays (`isLoading`, `loadingWidget`, `isError`, `errorOverlay`), QR customization (`qrTypeNumber`, `qrErrorCorrectLevel`, `qrMarginHorizontalRatio`, `qrMarginVerticalRatio`), and display toggles (`showEmptyAmount`, `showCurrencySymbol`, `showCurrencyLabel`, `alwaysShowBakongIcon`, `isDark`, `showShadow`, `onAmountTap`). See the [example](https://github.com/mrrhak/khqr_sdk/tree/master/example) for runnable examples of various usages.

## Bugs or Requests

If you encounter any problems feel free to open an [issue](https://github.com/mrrhak/khqr_sdk/issues/new?template=bug_report.md). If you feel the library is missing a feature, please raise a [ticket](https://github.com/mrrhak/khqr_sdk/issues/new?template=feature_request.md) on GitHub and I'll look into it. Pull request are also welcome.

See [Contributing.md](https://github.com/mrrhak/khqr_sdk/blob/master/CONTRIBUTING.md).

## License
This project is licensed under the [MIT License](https://github.com/mrrhak/khqr_sdk/blob/master/LICENSE).

## Support
Don't forget to give it a like 👍 or a star ⭐

## Activities
![Alt](https://repobeats.axiom.co/api/embed/c03b76c879011a105eeb936c5ce90c73a554ea8d.svg "Repobeats analytics image")