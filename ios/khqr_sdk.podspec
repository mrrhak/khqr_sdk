#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint khqr_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'khqr_sdk'
  s.version          = '1.0.0'
  s.summary          = 'KHQR is a standardization of QR Code (EMV) that will promote wider use of mobile retail payments in Cambodia.'
  s.description      = <<-DESC
The standardization of KHQR code specifications will help promote wider use of mobile retail payments in Cambodia and provide consistent user experience for merchants and consumers.
It can enable interoperability in the payment industry.
A common QR code would facilitate payments among different schemes, e-wallets and banks and would encourage small merchants to adopt KHQR code as payment method.
KHQR is created for retail or remittance in Cambodia and Cross-Border.
It only requires a single QR for receiving transactions from any payment provider through Bakong including Bakong App.
                       DESC
  s.homepage         = 'https://mrrhak.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Kimhak Long' => 'longkimhak.kh@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'BakongKHQR', '~> 1.0.0.15' 
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'khqr_sdk_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
