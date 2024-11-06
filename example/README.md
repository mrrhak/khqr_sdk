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
  bakongAccountId: 'john_smith@devb',
  merchantName: 'John Smith',
);
final khqrData = await _khqrSdk.generateIndividual(info);
```

### Generate KHQR (Merchant)
```dart
final info = MerchantInfo(
  bakongAccountId: 'john_smith@devb',
  acquiringBank: 'Dev Bank',
  merchantId: '123456',
  merchantName: 'John Smith',
);
final khqrData = await _khqrSdk.generateMerchant(info);
```

### Verify KHQR
```dart
const qrCode = '00020101021129190015john_smith@devb5204599953031165802KH5910John Smith6010Phnom Penh991700131727168754698630499FB';
final isValid = await _khqrSdk.verify(qrCode);
```

### Decode KHQR
```dart
const qrCode = '00020101021129190015john_smith@devb5204599953031165802KH5910John Smith6010Phnom Penh991700131727168754698630499FB';
final khqrDecodeData = await _khqrSdk.decode(qrCode);
```

### Generate KHQR Deeplink
```dart
const qrCode = '00020101021129190015john_smith@devb5204599953031165802KH5910John Smith6010Phnom Penh991700131727168754698630499FB';

final sourceInfo = SourceInfo(
  appName: 'Example App',
  appIconUrl: 'http://cdn.example.com/icons.logo.png',
  appDeepLinkCallBack: 'http://app.example.com',
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
  receiverName: 'John Smith',
  amount: 0,
  currency: KhqrCurrency.khr,
  qr: khqrContent,
),
```