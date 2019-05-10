#
# Be sure to run `pod lib lint QuickTransition.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QuickTransition'
  s.version          = '0.1.5'
  s.summary          = 'Quick and easy transition animation.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is a convenient and fast transition animation for users.
                       DESC

  s.homepage         = 'https://git.zhugefang.com/iOS/QuickTransition'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gaoyu' => 'gaoyu@zhugefang.com' }
  s.source           = { :git => 'git@git.zhugefang.com:iOS/QuickTransition.git', :tag => s.version.to_s }
  s.social_media_url = 'http://gaoyu.in'
  s.ios.deployment_target = '8.0'

  
  s.subspec 'Core' do |sp|
      sp.source_files = ['QuickTransition/Classes/Core/*']
  end

  s.subspec 'Alert' do |sp|
      sp.source_files = ['QuickTransition/Classes/Alert/*']
      sp.dependency 'QuickTransition/Core'
  end
  
  
  # s.resource_bundles = {
  #   'QuickTransition' => ['QuickTransition/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end