Pod::Spec.new do |s|
   s.name = 'MessageKit'
   s.version = '3.7.0'
   s.license = { :type => "MIT", :file => "LICENSE.md" }

   s.summary = 'An elegant messages UI library for iOS.'
   s.homepage = 'https://github.com/MessageKit/MessageKit'
   s.social_media_url = 'https://twitter.com/_SD10_'
   s.author = { "Steven Deutsch" => "stevensdeutsch@yahoo.com" }

   s.source = { :git => 'https://github.com/MessageKit/MessageKit.git', :tag => s.version }
   s.source_files = 'DevPods/MessageKit/Sources/**/*.swift'

   s.swift_version = '5.3'

   s.ios.deployment_target = '12.0'
   s.ios.resources = 'DevPods/MessageKit/Sources/Assets.xcassets'

   s.dependency 'InputBarAccessoryView', '~> 5.4.0'

end
