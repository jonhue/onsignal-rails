module DeviseOnesignal
    module DeviceConcern

        extend ActiveSupport::Concern

        extend DeviseOnesignal::DeviceHelper

        included do
            before_action :set_device
        end

        private

        def set_device
            unless cookies[:oneSignalPlayerId].nil?
                onesignal_player_id = cookies[:oneSignalPlayerId]
                device = Device.find_or_create_by! onesignal_id: onesignal_player_id
                device.onesignal_permission = cookies[:oneSignalPlayerPermission]
                device.last_used = Time.now
                set_device_owner device
                device.save!
            end
        end

        def set_device_owner resource
            resource.owner = current_user if current_user
        end

    end
end
