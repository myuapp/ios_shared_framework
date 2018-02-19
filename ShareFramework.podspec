Pod::Spec.new do |s| 
#1. 

s.name = "ShareFramework"
 
#2. 

s.version = "1.0.0"
 
#3. 

s.summary = "Sort description of 'ShareFramework' framework" 

#4. 

s.homepage = "http://www.yudiz.com" 

#5. 

s.license = "MIT" 

#6.

 s.author = "Hausla" 

#7. 

s.platform = :ios, "11.0" 

#8. 

s.source = { :git => "URL", :tag => "1.0.0" } 

#9. 

s.source_files = "ShareFramework", "ShareFramework/**/*.{h,m,swift}" 

s.dependency 'Alamofire' 

end