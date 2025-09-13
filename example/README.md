## Installation
```sh
flutter pub add khqr_sdk
```

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


### Verify KHQR
```dart
const qrCode = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh9917001317324625358296304B59E';
final res = KhqrSdk.verify(qrCode);
```

### Decode KHQR
```dart
const qrCode = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh9917001317324625358296304B59E';
final res = KhqrSdk.decode(qrCode);
```

### Decode Non-KHQR
```dart
const qrCode = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh9917001317324625358296304B59E';
final res = KhqrSdk.decodeNonKhqr(qrCode);
```

### Generate KHQR Deeplink
```dart
const qrCode = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh9917001317324625358296304B59E';

final sourceInfo = SourceInfo(
  appName: 'Example App',
  appIconUrl: 'http://cdn.example.com/icons.logo.png',
  appDeepLinkCallBack: 'http://app.example.com/callback',
);

final deeplinkInfo = DeeplinkInfo(
  qr: qrCode,
  url: 'http://api.example.com/v1/generate_deeplink_by_qr',
  sourceInfo: sourceInfo,
);

final res = await KhqrSdk.generateDeepLink(deeplinkInfo);
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

See the [example](https://github.com/mrrhak/khqr_sdk/tree/master/example) for runnable examples of various usages.