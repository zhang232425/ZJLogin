#
# Be sure to run `pod lib lint ZJLogin.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    
  s.name             = 'ZJLogin'
  s.version          = '0.1.0'
  s.summary          = 'A short description of ZJLogin.'

  s.homepage         = 'https://github.com/zhang232425/ZJLogin'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhang232425' => 'yonathan@asetku.com' }
  s.source           = { :git => 'https://github.com/zhang232425/ZJLogin.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '10.0'

  s.source_files = 'ZJLogin/Classes/**/*'
  s.resource_bundles = {
      'ZJLogin' => ['ZJLogin/Assets/**/*']
  }
  s.static_framework = true

  s.dependency 'RxSwift'
  s.dependency 'RxSwiftExt'
  s.dependency 'RxCocoa'
  s.dependency 'Action'
  s.dependency 'SwiftDate'
  s.dependency 'Then'
  
  s.dependency 'ZJRequest'
  s.dependency 'ZJActiveLabel'
  s.dependency 'ZJLocalizable'
  s.dependency 'ZJRouter'
  s.dependency 'ZJRoutableTargets'
  s.dependency 'ZJBase'
  s.dependency 'ZJExtension'
  s.dependency 'ZJHUD'
  s.dependency 'ZJCommonView'
  s.dependency 'ZJRefresh'
  s.dependency 'ZJCommonDefines'
  s.dependency 'ZJValidator'
  s.dependency 'ZJModalTransition'
  
  
  
end
