module DeviseOneSignal
    class Configuration

        cattr_accessor :app_id, instance_accessor: false

        def self.auto_register
            @@auto_register || false
        end
        cattr_writer :auto_register, instance_accessor: false

        def self.devise_class
            @@devise_class || 'User'
        end
        cattr_writer :devise_class, instance_accessor: false

    end
end
