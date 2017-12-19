module DeviseOnesignal
    module DeviceConcern

        extend ActiveSupport::Concern

        extend DeviseOnesignal::DeviceHelper

        included do
            before_action :set_device
        end

        private

        def set_device
            unless cookies[:oneSignalUserId].nil?
                onesignal_user_id = cookies[:oneSignalUserId]
                device = Device.find_or_create_by! onesignal_id: onesignal_user_id
                device.user = current_user if current_user
                device.permission = cookies[:oneSignalUserPermission]
                device.last_used = Time.now
                device.save!
            end
        end

    end
end
