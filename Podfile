require_relative '../node_modules/react-native/scripts/react_native_pods'
require_relative '../node_modules/@react-native-community/cli-platform-ios/native_modules'

pod 'GoogleSignIn'

platform :ios, '11.0'

target 'YumiNative' do
  config = use_native_modules!

  use_react_native!(
    :path => config[:reactNativePath],
    # to enable hermes on iOS, change `false` to `true` and then install pods
    :hermes_enabled => false
  )

  target 'YumiNativeTests' do
    inherit! :complete
    # Pods for testing
  end

  # Enables Flipper.
  #
  # Note that if you have use_frameworks! enabled, Flipper will not work and
  # you should disable the next line.
  use_flipper!({ 'Flipper' => '0.91.1', 'Flipper-Folly' => '~> 2.6', 'Flipper-RSocket' => '~> 1.4' })

  post_install do |installer|
    react_native_post_install(installer)

    # Apple Silicon builds require a library path tweak for Swift library discovery or "symbol not found" for swift things
    installer.aggregate_targets.each do |aggregate_target| 
      aggregate_target.user_project.native_targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings['LIBRARY_SEARCH_PATHS'] = ['$(SDKROOT)/usr/lib/swift', '$(inherited)']
        end
      end
      aggregate_target.user_project.save
    end

     # Flipper requires a crude patch to bump up iOS deployment target, or "error: thread-local storage is not supported for the current target"
    # I'm not aware of any other way to fix this one other than bumping iOS deployment target to match react-native (iOS 11 now)
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings["ONLY_ACTIVE_ARCH"] = "NO"
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
       end
    end

    # ...but if you bump iOS deployment target, Flipper barfs again "Time.h:52:17: error: typedef redefinition with different types"
    # We need to make one crude patch to RCT-Folly - set `__IPHONE_10_0` to our iOS target + 1
    # https://github.com/facebook/flipper/issues/834 - 84 comments and still going...
    `sed -i -e  $'s/__IPHONE_10_0/__IPHONE_12_0/' Pods/RCT-Folly/folly/portability/Time.h`
  end

end
