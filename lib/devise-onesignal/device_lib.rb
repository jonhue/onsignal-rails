module DeviseOnesignal
    module DeviceLib

        def onesignal_enabled?
            self.onesignal_permission == 'granted'
        end
        def onesignal_disabled?
            self.onesignal_permission == 'denied'
        end
        def onesignal_set?
            !self.onesignal_permission == 'default'
        end

    end
end
