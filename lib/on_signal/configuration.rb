module OnSignal

    class << self
        attr_accessor :configuration
    end

    def self.configure
        self.configuration ||= Configuration.new
        yield configuration
    end

    class Configuration

        attr_accessor :const_name

        def initialize
            @const_name = 'Device'
        end

    end
end
