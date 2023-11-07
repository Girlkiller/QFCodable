Pod::Spec.new do |s|
  s.name = 'QFCodable'
  s.version = '0.0.1'
  s.license = 'Apache License 2.0'
  s.summary = 'Decode data to model in Swift'
  s.homepage = 'https://github.com/Girlkiller/QFCodable'
  s.authors = { 'Feng QIU' => '137019550@qq.com' }
  s.source = { :git => 'https://github.com/Girlkiller/QFCodable.git', :tag => s.version }
  s.documentation_url = 'https://github.com/Girlkiller/QFCodable.git'

  s.ios.deployment_target = '12.0'
  # s.osx.deployment_target = '10.13'
  # s.tvos.deployment_target = '12.0'
  # s.watchos.deployment_target = '4.0'

  s.swift_versions = ['5']

  s.source_files = 'QFCodable/Source/*.swift'

end
