NotificationPusher.configure do |config|

    # A pusher handles the process of sending your notifications to various services for you.
    # Learn more: https://github.com/jonhue/notifications-rails/tree/master/notification-pusher#pushers
    # config.define_pusher :ActionMailer, email: 'my@email.com'
    config.define_pusher :OneSignal, app_id: Settings.onesignal.app_id, auth_key: Settings.onesignal.api_key

end
