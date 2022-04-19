
Pod::Spec.new do |s|
  s.name             = '${POD_NAME}'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ${POD_NAME}.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
                       
  s.homepage         = 'https://github.com/lyleLH/MTSpecs/${POD_NAME}'
  s.author           = { '${USER_NAME}' => '${USER_EMAIL}' }
  s.source           = { :git => 'https://github.com/lyleLH/MTSpecs/${POD_NAME}.git', :tag => s.version.to_s }
  s.ios.deployment_target = '9.0'
  s.source_files = '${POD_NAME}/Classes/**/*'

  s.prefix_header_file = '${POD_NAME}/Classes/Private/Business/${POD_NAME}PrefixHeader.pch'


  s.public_header_files = '${POD_NAME}/Classes/Public/**/*.h'

  
  s.dependency "MTCategoryComponent"
  s.dependency "MTBaseKit"
   

end
