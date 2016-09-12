#
#  Be sure to run `pod spec lint Deprecator.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "FAQ"
  s.version      = "0.9.0"
  s.summary      = "FAQ is an iOS library that makes building an FAQs section into your app super simple."
  s.homepage     = "http://red.to"

  s.license      = "MIT"
  s.author             = { "Red Davis" => "me@red.to" }
  s.social_media_url   = "http://twitter.com/reddavis"

  s.ios.deployment_target = "9.3"

  s.source       = { :git => "https://github.com/togethera/FAQ-iOS.git", :tag => "#{s.version}" }
  s.source_files = ['FAQ']
end
