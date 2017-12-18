module OneSignalUser

    extend ActiveSupport::Concern

    included do
        before_Action :set_onesignal_user
        helper_method :current_onesignal
    end

    def current_onesignal
        current_onesignal[:id] = cookies[:oneSignalUserId]
        current_onesignal[:permission] = cookies[:oneSignalUserPermission]
        current_onesignal[OneSignalUser::Configuration.devise_class.downcase.to_sym] = OneSignalUser::Configuration.devise_class.constantize&.find_by(onesignal_id: current_onesignal[:id]) if cookies.has_key?(:oneSignalUserId)
        current_onesignal
    end

    private

    def set_onesignal_user
        if current_user
            onesignal_user_id = cookies[:oneSignalUserId]
            if onesignal_user_id.nil?
                current_user.update_attributes onesignal_id: nil, onesignal_permission: nil
            else
                current_user.update_attributes onesignal_id: onesignal_user_id, onesignal_permission: cookies[:oneSignalUserPermission]
            end
        end
    end

end
