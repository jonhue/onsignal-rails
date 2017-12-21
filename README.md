# devise-onesignal

[![Gem Version](https://badge.fury.io/rb/devise-onesignal.svg)](https://badge.fury.io/rb/devise-onesignal) <img src="https://travis-ci.org/jonhue/devise-onesignal.svg?branch=master" />

Implement user targeted cross-platform notifications with OneSignal & Devise in your Rails app. Can also be used without Devise, but it is primarily intended to be used along with some sort of user-management-system.

This gem works well together with [notifications-rails](https://github.com/jonhue/notifications-rails) which introduces a notifications handling & pushing API. To build a cross-platform notification solution also add the [native](https://github.com/NativeGap/native-ruby) gem to your app.

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
    * [Devise object](#devise-object)
    * [Device methods](#device-methods)
    * [current_device](#current_device)
    * [Subscribing](#subscribing)
    * [Unsubscribing](#unsubscribing)
* [Configuration](#configuration)
* [To Do](#to-do)
* [Contributing](#contributing)
    * [Contributors](#contributors)
    * [Semantic versioning](#semantic-versioning)
* [License](#license)

---

## Installation

devise-onesignal works with Rails 5.0 onwards. You can add it to your `Gemfile` with:

```ruby
gem 'devise-onesignal'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise-onesignal

If you always want to be up to date fetch the latest from GitHub in your `Gemfile`:

```ruby
gem 'devise-onesignal', github: 'jonhue/devise-onesignal'
```

Now run the generator:

    $ rails g devise_onesignal

To wrap things up, migrate the changes into your database:

    $ rails db:migrate

It is time to [create your OneSignal app](https://onesignal.com) if you haven't already and set your application ID in the created initializer (`config/initializers/devise-onesignal.rb`).

Define an association in those models whose objects are supposed to be associated with OneSignal players. For example `User` in `app/models/user.rb`.

```ruby
has_many :devices, as: :owner
```

Now let us include the neccessary javascript files in our application (`apps/assets/javascripts/application.js`):

```js
//= require OneSignalSDK
//= require devise-onesignal
```

Finally initialize the javascript component when your assets load. If you are using Rails 5 with Turbolinks, this could look like this:

```js
document.addEventListener( 'turbolinks:load', function() {
    OneSignalInit();
});
```

## Usage

### Devise object

You most likely want to associate your devise object (e.g. `current_user`) with your OneSignal integration. Now, if your Devise model is called `User` and the `current_user` method is available you don't have to worry about that.

Let's say our Devise model is named `Admin`. Just add a `private` method to your `ApplicationController`:

```ruby
def set_device_owner
    current_admin if current_admin
end
```

**Note:** Essentially `set_device_owner` has to return a class object *or* `nil`.

### Device methods

devise-onesignal introduces a `Device` activerecord model. Every object of your devise class can have multiple devices, one for each device / browser they enabled OneSignal at least once.

```ruby
d = Device.first

# Returns object associated with device. Can return `nil`.
d.owner

# Returns OneSignal player id
d.onesignal_id

# Returns OneSignal permission ( `granted`/`denied`/`default` )
d.onesignal_permission

# Some timestamps
d.last_used
d.created_at
d.updated_at


# If device is ready to receive notifications
d.onesignal_enabled?

# If device has been disabled to receive notifications
d.onesignal_disabled?

# If device has been set previously to receive notifications or not
d.onesignal_set?
```

### current_device

In your controllers and views you can access a `current_device` method that returns the `Device` object of the current OneSignal subscription. If the user browsing your site is not subscribed to OneSignal, `current_device` returns an uncommitted `Device` object with some helpful information, like the `permission` attribute, set.

### Subscribing

Just call `OneSignalSubscribe();` in your frontend code and OneSignal will ask your user for permission to send notifications. On the following request an existing `Device` object will either get updated or a new one will get created.

### Unsubscribing

**Note:** You most likely don't want to let your users unsubscribe from receiving notifications, but instead allow them to manually disable receiving any new notifications. For that purpose use the [notifications-rails](https://github.com/jonhue/notifications-rails) gem, which adds a notification API and detailed user settings.

If you want to completely remove a user from OneSignal, call `OneSignalUnsubscribe();` in your javascript.

---

## Configuration

You can configure devise-onesignal by passing a block to `configure`. This can be done in `config/initializers/devise-onesignal.rb`:

```ruby
DeviseOnesignal.configure do |config|
    config.app_id = ''
end
```

**`app_id` (required)** Your OneSignal app id. Takes a string. Create one here: https://onesignal.com

**`auto_register`** Automatically try to subscribe the user when loading a page. Takes a boolean. Defaults to `false`.

**`persist_notification`** Automatically dismiss the notification after ~20 seconds in Chrome. Takes a boolean. Defaults to `false`.

**`subscribe_with_modal`** Show a modal instead of a native browser window when subscribing a user to OneSignal. Takes a boolean. Defaults to `false`.

---

## To Do

[Here](https://github.com/jonhue/devise-onesignal/projects/1) is the full list of current projects.

To propose your ideas, initiate the discussion by adding a [new issue](https://github.com/jonhue/devise-onesignal/issues/new).

---

## Contributing

We hope that you will consider contributing to `devise-onesignal`. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](https://github.com/jonhue/devise-onesignal/blob/master/CONTRIBUTING.md), [Code of Conduct](https://github.com/jonhue/devise-onesignal/blob/master/CODE_OF_CONDUCT.md)

### Contributors

Give the people some :heart: who are working on this project. See them all at:

https://github.com/jonhue/devise-onesignal/graphs/contributors

### Semantic Versioning

devise-onesignal follows Semantic Versioning 2.0 as defined at http://semver.org.

## License

MIT License

Copyright (c) 2017 Jonas Hübotter

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
