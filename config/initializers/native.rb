Native.configure do |config|

    # Specify platforms your app supports.
    # config.android = true
    # config.ios = true
    # config.uwp = true
    # config.chrome = true
    config.osx = false
    config.win32 = false
    config.win64 = false
    config.lin32 = false
    config.lin64 = false

    # Specify a stringified url helper to set a start url for each platform.
    config.android_url = 'setup_url'
    config.ios_url = 'setup_url'
    config.uwp_url = 'setup_url'
    config.chrome_url = 'setup_url'
    # config.osx_url = 'root_url'
    # config.win32_url = 'root_url'
    # config.win64_url = 'root_url'
    # config.lin32_url = 'root_url'
    # config.lin64_url = 'root_url'

    # The Android platform does not scale the content correctly. Set your `font-size` of `:root` on Android
    # config.scale_size = '18px'

end
