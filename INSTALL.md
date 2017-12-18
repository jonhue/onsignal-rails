**Thank you for installing devise-onesignal!**


There are three wo more steps to take:

1) Enter your OneSignal App ID in config/initializers/devise-onesignal.rb
2) Run `rails g devise_one_signal` and `rails db:migrate`
3) Add:

    //= require OneSignalSDK
    //= require devise-onesignal

to your javascript index in app/assets/javascripts/application.js


Learn more at https://github.com/jonhue/devise-onesignal.
