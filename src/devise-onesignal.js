export function init( appId, autoRegister = false, persistNotification = false ) {

    window.DeviseOneSignalPlayerId = null;
    window.DeviseOneSignal = window.OneSignal || [];

    window.DeviseOneSignal.push([ 'init', {
        appId: appId,
        autoRegister: autoRegister,
        welcomeNotification: {
            disable: true,
            title: '',
            message: ''
        },
        notifyButton: {
            enable: false
        },
        persistNotification: persistNotification // Automatically dismiss the notification after ~20 seconds in Chrome Desktop v47+
    }]);

    window.DeviseOneSignal.push(function() {
        window.DeviseOneSignal.getUserId().then(function(playerId) {
            if ( playerId != null ) {
                window.DeviseOneSignalPlayerId = playerId;
                document.cookie = 'oneSignalPlayerId=' + playerId;
            };
            window.DeviseOneSignal.push([ 'getNotificationPermission', function(permission) {
                document.cookie = 'oneSignalPlayerPermission=' + permission;
            }]);
        });
    });

};



export function subscribed() {
    window.DeviseOneSignalPlayerId != null;
};

export function subscribe(subscribeWithModal = false) {
    if (OneSignalSubscribed()) {
        window.DeviseOneSignal.setSubscription(true);
    } else {
        window.DeviseOneSignal.registerForPushNotifications({
            modalPrompt: subscribeWithModal
        });
    };
};

export function unsubscribe() {
    window.DeviseOneSignal.setSubscription(false);
};
