Pod::Spec.new do |s|
s.name             = "UNAlertView"
s.version          = "0.1.1"
s.summary          = "An UIAlertView replacement."
s.homepage         = "https://github.com/ytakzk/UNAlertView"
s.license          = 'MIT'
s.author           = { "ytakzk" => "shyss.ak@gmail.com" }
s.source           = { :git => "https://github.com/ytakzk/UNAlertView.git", :tag => s.version.to_s }
s.platform     = :ios, '8.0'
s.requires_arc = true
s.source_files = 'Classes/**/*.swift'
end
