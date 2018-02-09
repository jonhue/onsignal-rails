class OnSignal::Device < ApplicationRecord

    def onesignal_enabled?
        self.onesignal_permission == 'granted'
    end
    def onesignal_disabled?
        self.onesignal_permission == 'denied'
    end
    def onesignal_set?
        !self.onesignal_permission == 'default'
    end

    belongs_to :owner, polymorphic: true, optional: true

end
