Pod::Spec.new do |s|
s.name             = "UNAlertView"
s.version          = "0.2.0"
s.summary          = "An UIAlertView replacement."
s.homepage         = "https://github.com/ytakzk/UNAlertView"
s.license          = 'MIT'
s.author           = { "ytakzk" => "shyss.ak@gmail.com" }
s.source           = { :git => "https://github.com/ytakzk/UNAlertView.git", :tag => s.version.to_s }
s.requires_arc = true
s.source_files = 'Classes/**/*.swift'
s.swift_version = '4.0'
s.ios.deployment_target  = '9.0'
end
