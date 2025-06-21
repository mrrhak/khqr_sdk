# Changelog

## 1.3.1
- Fixed(generated_file): fixed `KhqrCurrency` enum value on MerchantInfo class

## 1.3.0
- Feat(khqr_card_widget): Add new `isError` and `isLoading` state
- Feat(khqr_card_widget): Add new `Retry` button display if `isError` true
- Feat(khqr_card_widget): Add new `Regenerate` button when QR was expired
- Refactor(khqr_card_widget): refactor time expire display
- Bumped(flutter_lints): bumped flutter_lints from `v5.0.0` to `v6.0.0`
- Bumped(flutter_svg): bumped flutter_lints from `v2.1.0` to `v2.2.0`
- Bumped(build_runner): bumped flutter_lints from `v2.4.15` to `v2.5.3`

## 1.2.0
- Added new feature to `Decode Non-KHQR` on Android platform
- Added new Bakong logo in `KhqrCardWidget`
- Added new field `merchantCategoryCode` with default value `5999`
- Fixed `merchantId` always receive `null` on iOS platform
- Upgrade iOS native SDK to `v1.0.0.17`
- Upgrade Android native SDK to `v1.0.0.15`

## 1.1.3
- Add auto size text for dynamic text resizing in `KhqrCardWidget`
- Update `KhqrCardWidget` switching theme mode base on app theme mode

## 1.1.2
- Adjust font size, QR quiet zone, and container decoration in `KhqrCardWidget`
- Updated dependencies

## 1.1.1
- Added new currency symbols
- Improvement KHQR Card Widget
- Updated dependencies

## 1.1.0
- Added new feature to `Decode Non-KHQR`
- Added expire timestamp for `Dynamic QR`
- Upgrade iOS native SDK to `v1.0.0.16`
- Upgrade Android native SDK to `v1.0.0.14`
- Updated generated Freezed files
- Updated dependencies

## 1.0.4
- Migrated Android platform language from Java to Kotlin
- Added enum value to KhqrCurrency to align with currency code from NBC
- Updated error message from Native side to Dart side
- Updated error code to identify error from native side
- Updated dependencies

## 1.0.3
- Updated KHQR Card Widget
- Added thousand number formatter util
- Allow to keep decimal places
- Updated dependencies

## 1.0.2
- Updated swift package manager support
- Updated KHQR Card Widget
- Updated README
- Updated dependencies

## 1.0.1
- Added public API documentation
- Added swift package manager
- Improved json serialization
- Improved lint analysis options
- Improved pub score
- Updated package description
- Updated README

## 1.0.0
- Initial release (iOS, Android)
- Added feature Generate KHQR (individual/merchant)
- Added feature Verification (Valid/Invalid)
- Added feature Decode KHQR Information
- Added feature Generate KHQR Deeplink
- Added KHQR Card Widget