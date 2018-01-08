require 'devise-onesignal/version'

module DeviseOnesignal

    require 'devise-onesignal/configuration'

    autoload :DeviceLib, 'devise-onesignal/device_lib'

    autoload :Owner, 'devise-onesignal/owner'
    autoload :DeviceConcern, 'devise-onesignal/device_concern'
    autoload :DeviceHelper, 'devise-onesignal/device_helper'

    require 'devise-onesignal/engine'
    require 'devise-onesignal/railtie'

end
