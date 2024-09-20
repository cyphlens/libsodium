#
# Be sure to run `pod lib lint libsodium.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'libsodium'
  s.version          = '1.0.20'
  s.summary          = 'Libsodium, also known as Sodium, is a powerful cryptography library'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Sodium is a modern, easy-to-use software library for encryption, decryption, signatures, password hashing, and more copy of 1.0.20'

  s.homepage         = 'https://github.com/alexinx/libsodium'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alexinx' => 'alexappadurai.swamydhas@ionixxtech.com' }
  s.source           = { :git => 'https://github.com/alexinx/libsodium.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files    = 'Sources/Classes/**/*.{c,h}'

  s.public_header_files = 'Sources/Classes/include/sodium/**/*.{h}'

  # s.header_mappings_dir = 'libsodium/Classes/include'
  s.requires_arc = false

  s.ios.xcconfig      = {  "OTHER_LDFLAGS" => "-DNATIVE_LITTLE_ENDIAN=1 -DHAVE_MADVISE -DHAVE_MMAP -DHAVE_MPROTECT -DHAVE_POSIX_MEMALIGN -DHAVE_WEAK_SYMBOLS"
                         }
  s.xcconfig = { 'HEADER_SEARCH_PATHS' => ' "$(PODS_ROOT)/libsodium/Sources/Classes/include/sodium" "$(PODS_ROOT)/libsodium/Sources/Classes/include" ' }


end
