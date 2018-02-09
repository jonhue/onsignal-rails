class OnSignal {

    constructor( appId, options = {} ) {
        this._oneSignal = window.OneSignal;
        this._playerId = null;

        let defaults = {
            autoRegister: false,
            persistNotification: false, // Automatically dismiss the notification after ~20 seconds in Chrome Desktop v47+
            welcomeNotification: {
                disable: true,
                title: '',
                message: ''
            },
            notifyButton: {
                enable: false
            }
        };
        options = extend( {}, defaults, options );
        options.appId = appId;

        this._oneSignal.push(['init', options]);

        this._oneSignal.push(() => {
            this._oneSignal.getUserId().then((playerId) => {
                if ( playerId != null ) {
                    this._playerId = playerId;
                    document.cookie = 'oneSignalPlayerId=' + this._playerId;
                };
                this._oneSignal.push([ 'getNotificationPermission', function(permission) {
                    this._permission = permission;
                    document.cookie = 'oneSignalPlayerPermission=' + this._permission;
                }]);
            });
        });
    }

    get oneSignal() {
        return this._oneSignal;
    }
    set oneSignal(val) {
        this._oneSignal = val;
    }

    get playerId() {
        return this._playerId;
    }
    set playerId(val) {
        this._playerId = val;
    }

    get permission() {
        return this._permission;
    }
    set permission(val) {
        this._permission = val;
    }

    isSubscribed() {
        return this._playerId != null;
    }
    subscribe(options = {}) {
        let defaults = {
            modalPrompt: false
        };
        options = extend( {}, defaults, options );

        if (this.isSubscribed()) {
            this._oneSignal.setSubscription(true);
        } else {
            this._oneSignal.registerForPushNotifications(options);
        };
    }
    unubscribe() {
        this._oneSignal.setSubscription(false);
    }

}


function extend() {
    for ( let i=1; i<arguments.length; i++ )
        for ( let key in arguments[i] )
            if ( arguments[i].hasOwnProperty(key) )
                arguments[0][key] = arguments[i][key];
    return arguments[0];
};


export default OnSignal;
