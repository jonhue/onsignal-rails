module DeviseOnesignal
    module DeviceHelper

        def current_device
            if cookies[:oneSignalPlayerId].nil?
                device = Device.new
                device.onesignal_permission = cookies[:oneSignalPlayerPermission]
                set_device_owner device
                device.last_used = Time.now
            else
                device = Device.find_by onesignal_id: cookies[:oneSignalPlayerId]
            end
            device
        end

    end
end
