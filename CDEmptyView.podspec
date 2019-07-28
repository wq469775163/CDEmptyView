#
# Be sure to run `pod lib lint CDEmptyView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CDEmptyView'
  s.version          = '0.0.4'
  s.summary          = 'A short description of CDEmptyView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
空试图展位
                       DESC

  s.homepage         = 'https://gitlab.ttsing.com/ios/CDEmptyView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WQ' => '469775163@qq.com' }
  s.source           = { :git => 'https://gitlab.ttsing.com/ios/CDEmptyView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CDEmptyView/Classes/**/*'



  
  # s.resource_bundles = {
  #   'CDEmptyView' => ['CDEmptyView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation', 'CoreFoundation' 
  # s.dependency 'AFNetworking', '~> 2.3'
end
