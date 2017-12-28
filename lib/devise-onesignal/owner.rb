module DeviseOnesignal
    module Owner

        def self.included base
            base.extend ClassMethods
        end

        module ClassMethods
            def has_devices
                has_many :devices, as: :owner, dependent: :destroy
                include DeviseOnesignal::Owner::InstanceMethods
            end
        end

        module InstanceMethods

            def onesignal_player_ids
                onesignal_player_ids = []
                self.devices.each do |device|
                    onesignal_player_ids << device.onesignal_id
                end
                onesignal_player_ids
            end

        end

    end
end
