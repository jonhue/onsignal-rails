module DeviseOnesignal
    module DeviceLib

        def onesignal_enabled?
            self.permission == 'granted'
        end
        def onesignal_disabled?
            self.permission == 'denied'
        end
        def onesignal_set?
            !self.permission == 'default'
        end

    end
end
