module DeviseOneSignal
    class Configuration

        attr_accessor :app_id

        attr_writer :auto_register
        def auto_register
            @auto_register || false
        end

        attr_writer :devise_class
        def devise_class
            @devise_class || 'User'
        end

    end
end
