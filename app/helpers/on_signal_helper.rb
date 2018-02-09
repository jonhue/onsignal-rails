module OnSignalHelper

    def current_onsignal
        if cookies[:oneSignalPlayerId].nil?
            device = OnSignal.configuration.device_const.constantize.new
            device.onesignal_permission = cookies[:oneSignalPlayerPermission]
            device.owner = set_onsignal_owner
            device.last_used = Time.now
        else
            device = OnSignal.configuration.device_const.constantize.find_by onesignal_id: cookies[:oneSignalPlayerId]
        end
        device
    end

end
