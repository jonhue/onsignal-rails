# frozen_string_literal: true

module OnSignal
  class Device < ApplicationRecord
    def onesignal_enabled?
      onesignal_permission == 'granted'
    end

    def onesignal_disabled?
      onesignal_permission == 'denied'
    end

    def onesignal_set?
      !onesignal_permission == 'default'
    end

    belongs_to :owner, polymorphic: true, optional: true
  end
end
