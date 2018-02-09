require 'rails/railtie'

module OnSignal
    class Railtie < Rails::Railtie

        initializer 'onsignal.initialize' do
            ActiveSupport.on_load :action_controller do
                include OnSignalHelper
                include OnSignalController
            end
            ActiveSupport.on_load :active_record do
                include OnSignalModel
            end
        end

    end
end
