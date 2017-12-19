class Device < ActiveRecord::Base

    extend DeviseOnesignal::DeviceLib

    belongs_to DeviseOnesignal.configuration.devise_class.downcase.to_sym, optional: true

end
