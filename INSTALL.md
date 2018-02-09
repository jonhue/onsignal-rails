**Thank you for installing OnSignal!**


There are four wo more steps to take:

1) Run `rails g devise_onesignal` and `rails db:migrate`
2) Enter your OneSignal App ID in config/initializers/devise-onesignal.rb
3) Add:

    import 'devise-onesignal/dist/OneSignalSDK';
    import * as deviseOneSignal from 'devise-onesignal';

to your webpack pack in app/javascript/packs/application.js
4) Add:

    has_devices

to your authentication model


Learn more at https://github.com/jonhue/devise-onesignal
