DeviseOnesignal.configure do |config|

    ### ONESIGNAL ###

    # Your OneSignal app id. Create one here: https://onesignal.com
    config.app_id = ''


    ### DEVISE ###

    # Specify your devise class. Defaults to `'User'`.
    # config.devise_class = 'User'


    ### CUSTOMIZATION ###

    # Automatically try to subscribe the user when loading a page. Defaults to `false`.
    # config.auto_register = false

    # Automatically dismiss the notification after ~20 seconds in Chrome. Defaults to `false`.
    # config.persist_notification = false

    # Show a modal instead of a native browser window when subscribing a user to OneSignal. Defaults to `false`.
    # config.subscribe_with_modal = false

end
