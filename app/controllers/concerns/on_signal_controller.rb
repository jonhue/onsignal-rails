# frozen_string_literal: true

module OnSignalController
  extend ActiveSupport::Concern

  included do
    before_action :set_onsignal
  end

  def set_onsignal_user
    current_user if respond_to?(:current_user) && current_user
  end

  private

  def set_onsignal
    return if cookies[:oneSignalPlayerId].nil?

    onesignal_player_id = cookies[:oneSignalPlayerId]
    device = OnSignal.configuration.device_const.constantize
                     .find_or_create_by!(onesignal_id: onesignal_player_id)
    device.onesignal_permission = cookies[:oneSignalPlayerPermission]
    device.last_used = Time.now
    device.owner = set_onsignal_user
    device.save!
  end
end
