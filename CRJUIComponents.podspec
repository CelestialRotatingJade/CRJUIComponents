#
# Be sure to run `pod lib lint CRJUIComponents.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CRJUIComponents'
  s.version          = '0.1.1'
  s.summary          = 'A short description of CRJUIComponents.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/CelestialRotatingJade/CRJUIComponents'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhuyuhui434@gmail.com' => 'zhuyuhui434@gmail.com' }
  s.source           = { :git => 'https://github.com/CelestialRotatingJade/CRJUIComponents.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

#  s.source_files = 'CRJUIComponents/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CRJUIComponents' => ['CRJUIComponents/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.public_header_files = 'CRJUIComponents/**/CRJUIComponents.h'
  s.source_files = 'CRJUIComponents/**/CRJUIComponents.h'

  s.subspec 'BaseShowPickerView' do |ss|
    ss.source_files = 'CRJUIComponents/**/BaseShowPickerView/*.{h,m}'
  end

  s.subspec 'DateItemPickerView' do |ss|
    ss.source_files = 'CRJUIComponents/**/DateItemPickerView/*.{h,m}'
    ss.dependency 'CRJUIComponents/BaseShowPickerView'
    ss.dependency 'CRJCategories'
    ss.dependency 'CRJCommon'
  end

  s.subspec 'PlaceholderImageView' do |ss|
    ss.source_files = 'CRJUIComponents/**/PlaceholderImageView/*.{h,m}'
    ss.dependency 'SDWebImage'
  end
  
  s.subspec 'EdgeInsetsLabel' do |ss|
    ss.source_files = 'CRJUIComponents/**/EdgeInsetsLabel/*.{h,m}'
    ss.dependency 'CRJCategories'
  end
  
  s.subspec 'RotateView' do |ss|
    ss.source_files = 'CRJUIComponents/**/RotateView/*.{h,m}'
#    ss.dependency 'CRJCategories'
  end
  
  s.subspec 'InfiniteRotationView' do |ss|
    ss.source_files = 'CRJUIComponents/**/InfiniteRotationView/*.{h,m}'
  end
  
  s.subspec 'BadgeValueView' do |ss|
    ss.source_files = 'CRJUIComponents/**/BadgeValueView/*.{h,m}'
    ss.dependency 'CRJCategories'
  end
  
  s.subspec 'CircleAnimationView' do |ss|
    ss.source_files = 'CRJUIComponents/**/CircleAnimationView/*.{h,m}'
    ss.dependency 'CRJEasing'
  end
  
  s.subspec 'RoundingCornerView' do |ss|
    ss.source_files = 'CRJUIComponents/**/RoundingCornerView/*.{h,m}'
  end
  
  
  # s.dependency 'CRJCommon'
  # s.dependency 'CRJCategories'
  # s.dependency 'CRJUIButton'
  # s.dependency 'CRJEdgeInsetsLabel'
  
end
