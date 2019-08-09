Pod::Spec.new do |s|
  s.name         = "MediaFireSDK"
  s.version      = "1.0.1"
  s.summary      = "MediaFire's Objective-C SD. Leverage the MediaFire Platform to connect with millions of MediaFire users around the world and add powerful features to your iOS or Mac OSX app."
  s.homepage     = "https://github.com/MediaFire/mediafire-objectivec-sdk"
  s.license      = 'Apache-2.0'
  s.author       = { "MediaFire" => "https://www.mediafire.com/" }
  s.source       = { :git => "https://github.com/leshkoapps/mediafire-objectivec-sdk.git", :branch => 'master' }
  s.ios.deployment_target = '7.0'
  s.source_files = 'MediaFireSDK/*.{h,m}', 'MediaFireSDK/categories/*.{h,m}', 'MediaFireSDK/httpclient/*.{h,m}', 'MediaFireSDK/protocols/*.{h,m}', 'MediaFireSDK/requestmanagers/*.{h,m}', 'MediaFireSDK/restapi/*.{h,m}', 'MediaFireSDK/utils/*.{h,m}'
  s.requires_arc = true
  s.framework = 'Foundation'
end
