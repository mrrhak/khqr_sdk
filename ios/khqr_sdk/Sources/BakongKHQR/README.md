# BakongKHQR

## Run example project
1. Clone the repo, and go to Example directory then run `pod install`.
2. After pod installed, open `BakongKHQR.xcworkspace` with xcode and run `⌘ Cmd + r`. 

## Run unit test
1. Open example project. 
2. `⌘ Cmd + u` to run unit test.

## Requirements

## Installation

BakongKHQR is available through  private [CocoaPods](https://gitlab.nbc.gov.kh/khqr/khqr-ios-pod.git). To install
it, simply add the following line to your Podfile:

```ruby
source "https://sambo:ycfXmxxRbyzEmozY9z6n@gitlab.nbc.gov.kh/khqr/khqr-ios-pod.git"
target 'App_Name' do
  pod 'BakongKHQR'
end
```

## Create KHQR 
### Generate individual 
Objective c:
```
IndividualInfo * info = [[IndividualInfo alloc] initWithAccountId: @"john_smith@devb"
                                                     merchantName: @"John Smith"
                                               accountInformation: @"123123"
                                                    acquiringBank: @"Dev bank"
                                                         currency: Usd
                                                           amount: 100];
[info setBillNumber: @"#12345"];
[info setMobileNumber: @"012233455"];
[info setStoreLabel: @"Coffee Shop"];
[info setTerminalLabel: @"Cashier_1"];

KHQRResponse * khqrResponse = [BakongKHQR generateIndividual: info];
if (khqrResponse.status.errorCode == 0) {
    KHQRData * khqrData = (KHQRData *) khqrResponse.data;
    NSLog(@"data: %@", khqrData.qr);
    NSLog(@"md5: %@", khqrData.md5);
}
```
Swift:
```
let info = IndividualInfo(accountId: "john_smith@devb",
                       merchantName: "John Smith",
                 accountInformation: "123123", 
                      acquiringBank: "Dev bank",
                           currency: .Usd,
                             amount: 100)

info?.billNumber = "#12345"
info?.mobileNumber = "012233455"
info?.storeLabel = "Coffee Shop"
info?.terminalLabel = "Cashier_1"
let khqrResponse = BakongKHQR.generateIndividual(info!)
if khqrResponse.status?.errorCode == 0 {
    let khqrData = khqrResponse.data as? KHQRData
    print("data: \(khqrData?.qr)")
    print("md5: \(khqrData?.md5)")
}

```
Result: 
> data: 00020101021229410015john_smith@devb01061231230208Deb bank52045999530384054031005802KH5910John Smith6010Phnom Penh62510106#1234502090122334550311Coffee Shop0709Cashier_1991700131630652610673630405C6
> <br/>md5: 15ce010e4889d8b4c9debf7a1ab4e979

### Generate merchant 
Objective c:
```
MerchantInfo * merchantInfo = [[MerchantInfo alloc] initWithAccountId: @"john_smith@devb"
                                                           merchantId: @"123456"
                                                         merchantName: @"John Smith"
                                                        acquiringBank: @"Dev Bank"
                                                             currency: Usd
                                                               amount: 100];
[merchantInfo setBillNumber: @"#12345"];
[merchantInfo setMobileNumber: @"012233455"];
[merchantInfo setStoreLabel: @"Coffee Shop"];
[merchantInfo setTerminalLabel: @"Cashier_1"];

KHQRResponse * khqrResponse = [BakongKHQR generateMerchant: merchantInfo];
if (khqrResponse.status.errorCode == 0) {
    KHQRData * khqrData2 = (KHQRData *) khqrResponse.data;
    NSLog(@"data: %@", khqrData2.qr);
    NSLog(@"md5: %@", khqrData2.md5);
}
    
```
Swift:
```
let merchantInfo = MerchantInfo(accountId: "john_smith@devb",
                               merchantId: "123456",
                             merchantName: "John Smith",
                                        acquiringBank: "Dev Bank",
                                        currency: .Usd,
                                        amount: 100)
        
merchantInfo?.billNumber = "#12345"
merchantInfo?.mobileNumber = "012233455"
merchantInfo?.storeLabel = "Coffee Shop"
merchantInfo?.terminalLabel = "Cashier_1"
        
let khqrResponse = BakongKHQR.generateMerchant(merchantInfo!)
if khqrResponse.status?.errorCode == 0 {
    let khqrData = khqrResponse.data as? KHQRData
    print(khqrData?.qr)
    print(khqrData?.md5)
}

```
Result: 
> data: 00020101021230410015john_smith@devb01061234560208Dev Bank5204599953038405405100.05802KH5910John Smith6010Phnom Penh62510106#1234502090122334550311Coffee Shop0709Cashier_199170013162615786964863048691
> <br/>md5: 3c010c08548a9953b0bd76f95c2fa4e2

## Verify CRC
Objective c: 
```
NSString *qrCode = @"00020101021229190015john_smith@devb5204599953038405405100.05802KH5910John Smith6010Phnom Penh62510106#1234502090122334550311Coffee Shop0709Cashier_19917001316261470667896304E6F6";
KHQRResponse * response = [BakongKHQR verify: qrCode];
CRCValidation* crcValidation = (CRCValidation *) response.data;
NSLog(@"is valid: %d", crcValidation.valid);
```

Swift: 
```
let qrCode = "00020101021229190015john_smith@devb5204599953038405405100.05802KH5910John Smith6010Phnom Penh62510106#1234502090122334550311Coffee Shop0709Cashier_19917001316261470667896304E6F6"
let response = BakongKHQR.verify(qrCode)
let crcValidation = response?.data as? CRCValidation
print("is valid : \(crcValidation?.valid)")
```
Result:
> <br/>is valid: 1

## Decode
Objective c: 
```
KHQRResponse* decodeResponse = [BakongKHQR decode: @"00020101021229190015john_smith@devb5204599953038405405100.05802KH5910John Smith6010Phnom Penh62510106#1234502090122334550311Coffee Shop0709Cashier_19917001316261470667896304E6F6"];
KHQRDecodeData* decodeData = (KHQRDecodeData *) decodeResponse.data;
[decodeData printAll];
```

Swift: 
```
let decodeResponse = BakongKHQR.decode("00020101021229190015john_smith@devb5204599953038405405100.05802KH5910John Smith6010Phnom Penh62510106#1234502090122334550311Coffee Shop0709Cashier_19917001316261470667896304E6F6")
let decodeData = decodeResponse?.data as? KHQRDecodeData
decodeData?.printAll()
```
Result: 
> <br/>payloadFormatIndicator = 01
> <br/>pointOfInitiationMethod = 12
> <br/>merchantType = 29
> <br/>bakongAccountID = john_smith@devb
> <br/>merchantAccountId = (null)
> <br/>accountInformation = (null) 
> <br/>acquiringBank = (null)
> <br/>merchantCategoryCode = 5999
> <br/>countryCode = KH
> <br/>merchantName = John Smith
> <br/>merchantCity = Phnom Penh
> <br/>transactionCurrency = 840
> <br/>transactionAmount = 100.0
> <br/>billNumber = #12345
> <br/>storeLabel = Coffee Shop
> <br/>terminalLabel = Cashier_1
> <br/>timestamp = 1626147066789
> <br/>crc = E6F6

## Generate deeplink
Objective c: 
```
KHQRResponse* deeplinkResponse = [BakongKHQR generateDeepLink: @"http://13.251.28.100/v1/generate_deeplink_by_qr"
                                                           qr: khqrData.qr
                                                   sourceInfo: [[SourceInfo alloc]
                               initWithAppIconURL:@"https://bakong.nbc.org.kh/images/logo.svg"
                                          appName:@"Bakong"
                              appDeepLinkCallBack:@"https://bakong.page.link"]];
KHQRDeepLinkData* deeplinkData = (KHQRDeepLinkData *) deeplinkResponse.data;
NSLog(@"%@", deeplinkData.shortLink);
```
Swift: 
```
let deeplinkResponse = BakongKHQR.generateDeepLink("https://sit-api-bakong.nbc.org.kh/v1/generate_deeplink_by_qr",
                                                      qr: khqrData.qr,
                                              sourceInfo:
                                              SourceInfo(appIconURL:"https://bakong.nbc.org.kh/images/logo.svg",
                                                            appName: "Bakong",
                                                appDeepLinkCallBack: "https://bakong.page.link"))
let deeplinkData = deeplinkResponse?.data as? KHQRDeepLinkData
print(deeplinkData?.shortLink)
```
Result: 
> <br/>https://bakongsit.page.link/Hraaj4CAmnQLTjVK7

## Author

samboseth168@nbc.org.kh

## License

BakongKHQR is available under the MIT license. See the LICENSE file for more info.

