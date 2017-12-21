class Device < ActiveRecord::Base

    extend DeviseOnesignal::DeviceLib

    belongs_to :owner, polymorphic: true, optional: true

end
