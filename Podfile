# Uncomment the next line to define a global platform for your project
 platform :ios, '15.5'

target 'GithookPOC' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for GithookPOC
  pod 'SwiftLint'

  target 'GithookPOCTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'GithookPOCUITests' do
    # Pods for testing
  end

end
post_install do |installer|
   installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['COMPILER_INDEX_STORE_ENABLE'] = "NO"
        end
    end
end
