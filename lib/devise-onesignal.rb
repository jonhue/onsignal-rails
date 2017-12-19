require 'devise-onesignal/version'

module DeviseOnesignal

    class << self
        attr_accessor :configuration
    end

    def self.configure
        self.configuration ||= Configuration.new
        yield configuration
    end

    require 'devise-onesignal/configuration'

    autoload :DeviceLib, 'devise-onesignal/device_lib'

    autoload :DeviceConcern, 'devise-onesignal/device_concern'
    autoload :DeviceHelper, 'devise-onesignal/device_helper'
    require 'devise-onesignal/railtie'

    class Engine < ::Rails::Engine
    end

end
