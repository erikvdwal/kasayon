Pod::Spec.new do |s|
  s.name             = 'Kasayon'
  s.version          = '0.1.0'
  s.summary          = 'A collection of swifty protocols and extensions for table- and collectionview'
  s.homepage         = 'https://github.com/erikvdwal/kasayon'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Erik van der Wal' => 'erikvdwal@gmail.com' }
  s.source           = { :git => 'https://github.com/erikvdwal/kasayon.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/eriq'
  s.description      = <<-DESC
Kasayon, which apparently means 'Convenience' in Cuban, is a collection of protocols that aim to make working with table- and collectionviews a bit easier.
                       DESC
                       
  s.ios.deployment_target = '9.0'
  s.source_files = 'Source/**/*'
end
