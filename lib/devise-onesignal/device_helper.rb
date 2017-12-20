module DeviseOnesignal
    module DeviceHelper

        def current_device
            if cookies[:oneSignalUserId].nil?
                device = Device.new
                device.user = current_user if current_user
                device.onesignal_permission = cookies[:oneSignalUserPermission]
                device.last_used = Time.now
            else
                device = Device.find_by(onesignal_id: cookies[:oneSignalUserId])
            end
            device
        end

    end
end
