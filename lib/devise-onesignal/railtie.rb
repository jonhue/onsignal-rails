require 'rails'

module DeviseOnesignal
    class Railtie < Rails::Railtie

        initializer 'nestive-rails.action_controller' do
            ActiveSupport.on_load :action_controller do
                include DeviseOnesignal::Device
            end
        end

    end
end
