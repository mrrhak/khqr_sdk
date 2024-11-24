## Installation
```sh
flutter pub add khqr_sdk
```

## Usage
### Create instance of KHQR SDK
```dart
import 'package:khqr_sdk/khqr_sdk.dart';

final _khqrSdk = KhqrSdk();
```

### Generate KHQR (Individual)
```dart
final info = IndividualInfo(
  bakongAccountId: 'kimhak@dev',
  merchantName: 'Kimhak',
  accountInformation: '123456789',
);
final khqrData = await _khqrSdk.generateIndividual(info);
```

### Generate KHQR (Merchant)
```dart
final info = MerchantInfo(
  bakongAccountId: 'kimhak@dev',
  acquiringBank: 'Dev Bank',
  merchantId: '123456',
  merchantName: 'Kimhak',
);
final khqrData = await _khqrSdk.generateMerchant(info);
```

### Verify KHQR
```dart
const qrCode = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh9917001317324625358296304B59E';
final isValid = await _khqrSdk.verify(qrCode);
```

### Decode KHQR
```dart
const qrCode = '00020101021129270010kimhak@dev01091234567895204599953031165802KH5906Kimhak6010Phnom Penh9917001317324625358296304B59E';
final khqrDecodeData = await _khqrSdk.decode(qrCode);
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

final deeplinkData = await _khqrSdk.generateDeepLink(deeplinkInfo);
```

### KHQR Card Widget
```dart
KhqrCardWidget(
  width: 300.0,
  receiverName: 'Kimhak',
  amount: 0,
  currency: KhqrCurrency.khr,
  qr: khqrContent,
),
```