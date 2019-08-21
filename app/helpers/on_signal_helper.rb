# frozen_string_literal: true

module OnSignalHelper
  def current_onsignal
    if cookies[:oneSignalPlayerId].nil?
      new_device
    else
      find_device
    end
  end

  private

  def new_device
    device = OnSignal.configuration.device_const.constantize.new
    device.onesignal_permission = cookies[:oneSignalPlayerPermission]
    device.owner = set_onsignal_owner
    device.last_used = Time.now
    device
  end

  def find_device
    OnSignal.configuration.device_const.constantize
            .find_by(onesignal_id: cookies[:oneSignalPlayerId])
  end
end
