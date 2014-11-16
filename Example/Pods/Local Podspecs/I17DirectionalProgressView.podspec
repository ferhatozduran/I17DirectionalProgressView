#
# Be sure to run `pod lib lint I17DirectionalProgressView.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "I17DirectionalProgressView"
  s.version          = "0.1.0"
  s.summary          = "A UIProgressView wrapper that animates progress in any horizontal or vertical direction."
  s.description      = <<-DESC
A UIProgressView wrapper that animates progress in four directions:
Left to Right
Right to Left
Top to Bottom
Bottom to Top
                       DESC
  s.homepage         = "https://github.com/ferhatozduran"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Ferhat Ozduran" => "ferhatozduran@gmail.com" }
  s.source           = { :git => "https://github.com/ferhatozduran/I17DirectionalProgressView.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'I17DirectionalProgressView' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
