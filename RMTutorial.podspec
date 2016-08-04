#
# Be sure to run `pod lib lint RMTutorial.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RMTutorial'
  s.version          = '0.2.2'
  s.summary          = 'Popover Turorial Sequence'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
A Tutorial Sequence Using a series of Popover Views anchored to a CGPoint displaying Text.  Tapping the background moves to the next point in the sequence
                       DESC

  s.homepage         = 'https://github.com/rjmiller2543/RMTutorial'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rjmiller2543' => 'robertmiller2543@gmail.com' }
  s.source           = { :git => 'https://github.com/rjmiller2543/RMTutorial.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/MillerTheMaker'

  s.ios.deployment_target = '8.0'

  s.source_files = 'RMTutorial/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RMTutorial' => ['RMTutorial/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'DXPopoverKnockdownFork'
end
