module OnSignalModel

    extend ActiveSupport::Concern

    module ClassMethods
        def onsignal
            has_many :devices, as: :owner, class_name: OnSignal.configuration.const_name, dependent: :destroy
            include OnSignal::Owner::InstanceMethods
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
