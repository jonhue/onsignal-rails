module DeviseOnesignal

    class << self
        attr_accessor :configuration
    end

    def self.configure
        self.configuration ||= Configuration.new
        yield configuration
    end
    
    class Configuration

        attr_accessor :app_id
        attr_accessor :auto_register
        attr_accessor :persist_notification
        attr_accessor :subscribe_with_modal

        def initialize
            @auto_register = false
            @persist_notification = false
            @subscribe_with_modal = false
        end

    end
end
