Pod::Spec.new do |s|
  s.name = "LYPopMenu"
  s.version = "2.0"
  s.summary = "弹出式菜单选择器"
  s.homepage = "https://github.com/GordonLY/LYPopMenu"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.authors = "LYPC", "Gordon"
  s.ios.deployment_target = "8.0"
  s.source = { :git => "https://github.com/GordonLY/LYPopMenu.git", :tag => s.version }
  s.framework = "UIKit"

  s.subspec "LYPopMenu" do |ss|
    ss.source_files  = "LYPopMenu/*.swift"
  end
end
