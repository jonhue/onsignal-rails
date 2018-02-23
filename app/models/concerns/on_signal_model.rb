module OnSignalModel

    extend ActiveSupport::Concern

    module ClassMethods
        def onsignal
            has_many :devices, as: :owner, class_name: OnSignal.configuration&.device_const || 'Device', dependent: :destroy
            include OnSignalModel::InstanceMethods
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
