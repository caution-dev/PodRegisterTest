#
#  Be sure to run `pod spec lint CoCoButton.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "CoCoButton"
  s.version      = "0.0.1"
  s.summary      = "A short description of CoCoButton."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                   CoCoButton is custom button class (subclass for UIView and without UIControl).
                  DESC
  s.homepage     = "https://github.com/caution-dev/TIL/tree/master/MyButton/CustomButton"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Caution Kim" => "caution.dev@gmail.com" }
  s.source             = { :git => "https://github.com/caution-dev/PodRegisterTest.git", :tag => "#{s.version}" }
  s.ios.deployment_target = '10.0'
  s.source_files = 'Sources/*.swift'
end
