require 'rails/railtie'

module DeviseOnesignal
    class Railtie < Rails::Railtie

        initializer 'devise-onesignal.initialize' do
            abort 'Set your OneSignal app id in `config/initializers/devise-onesignal.rb`' if DeviseOnesignal.configuration && ( DeviseOnesignal.configuration.app_id.nil? || DeviseOnesignal.configuration.app_id == '' )
            ActiveSupport.on_load :action_controller do
                include DeviseOnesignal::DeviceConcern
            end
            ActiveSupport.on_load :action_view do
                include DeviseOnesignal::DeviceHelper
            end
            ActiveSupport.on_load :active_record do
                include DeviseOnesignal::Owner
            end
        end

    end
end
