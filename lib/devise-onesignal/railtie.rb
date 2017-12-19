require 'rails'

module DeviseOnesignal
    class Railtie < Rails::Railtie

        initializer 'devise-onesignal.initialize' do
            abort 'Please set your OneSignal app id in `config/initializers/devise-onesignal.rb`' if DeviseOnesignal.configuration.app_id.nil?
            ActiveSupport.on_load :action_controller do
                include DeviseOnesignal::DeviceConcern
            end
            ActiveSupport.on_load :action_view do
                include DeviseOnesignal::DeviceHelper
            end
        end

    end
end
