# frozen_string_literal: true

module OnSignal
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  class Configuration
    attr_accessor :device_const

    def initialize
      @device_const = 'Device'
    end
  end
end
