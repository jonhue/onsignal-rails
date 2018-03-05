# OnSignal on Rails

[![Gem Version](https://badge.fury.io/rb/onsignal.svg)](https://badge.fury.io/rb/onsignal) <img src="https://travis-ci.org/jonhue/onsignal-rails.svg?branch=master" />

A OneSignal API wrapper simplifying user targeted cross platform notifications. OnSignal consists of a JavaScript and a Rails API:

* [JavaScript API](https://github.com/jonhue/onsignal): Handle user subscriptions to OneSignal in your frontend code.
* [Rails API](#usage): Attach OneSignal players to user records provided by an authentication solution.

---

## Table of Contents

* [Usage](#usage)
    * [Installation](#installation)
    * [User associations](#user-associations)
    * [Devices](#devices)
        * [Methods](#methods)
        * [Helpers](#helpers)
    * [Configuration](#configuration)
* [To Do](#to-do)
* [Contributing](#contributing)
    * [Contributors](#contributors)
    * [Semantic versioning](#semantic-versioning)
* [License](#license)
---

## Usage

Attach OneSignal players to user records provided by an authentication solution.

### Installation

OnSignal works with Rails 5 onwards. You can add it to your `Gemfile` with:

```ruby
gem 'onsignal'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install onsignal

If you always want to be up to date fetch the latest from GitHub in your `Gemfile`:

```ruby
gem 'onsignal', github: 'jonhue/onsignal'
```

Now run the generator:

    $ rails g onsignal

To wrap things up, migrate the changes into your database:

    $ rails db:migrate

### User associations

Define an association in models whose objects are supposed to be associated with OneSignal players. For example `Admin` in `app/models/admin.rb`.

```ruby
class Admin < ApplicationRecord
    onsignal
end
```

Next attach a user object by defining a `set_onsignal_user` method. Let's say model our is named `Admin` and `current_admin` is available at controller level. Just add a method to your `ApplicationController`:

```ruby
def set_onsignal_user
    current_admin if current_admin
end
```

**Note:** If a `current_user` method is available at controller level this method is not required.

You are now able to get OneSignal players for a specific user:

```ruby
a = Admin.first

# All device records of a user
a.devices

# All OneSignal Player ID's of a user returned as an array
a.onesignal_player_ids
```

### Devices

OnSignal introduces a `Device` ActiveRecord model. You can [configure](#configuration) its name. Every record of an associated user class can have multiple devices - one for each device / browser they enabled OneSignal on.

#### Methods

```ruby
d = Device.first

# Returns user associated with device. Can return `nil`.
d.owner

# Returns OneSignal player id
d.onesignal_id

# Returns OneSignal permission ( `granted` / `denied` / `default` )
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

#### Helpers

In your controllers and views you can access a `current_onsignal` method that returns the `Device` object of the current OneSignal subscription. If the user browsing your site is not subscribed to OneSignal, `current_onsignal` returns an uncommitted `Device` object with some helpful information, like the `permission` attribute, set.

### Configuration

You can configure OnSignal by passing a block to `configure`. This can be done in `config/initializers/onsignal.rb`:

```ruby
OnSignal.configure do |config|
    config.device_const = 'Device'
end
```

* `device_const` Name of the constant exposing devices. Takes a constant name (string). Defaults to `'Device'`.

---

## To Do

[Here](https://github.com/jonhue/onsignal-rails/projects/1) is the full list of current projects.

To propose your ideas, initiate the discussion by adding a [new issue](https://github.com/jonhue/onsignal-rails/issues/new).

---

## Contributing

We hope that you will consider contributing to OnSignal on Rails. Please read this short overview for some information about how to get started:

[Learn more about contributing to this repository](CONTRIBUTING.md), [Code of Conduct](CODE_OF_CONDUCT.md)

### Contributors

Give the people some :heart: who are working on this project. See them all at:

https://github.com/jonhue/onsignal-rails/graphs/contributors

### Semantic Versioning

OnSignal on Rails follows Semantic Versioning 2.0 as defined at http://semver.org.

## License

MIT License

Copyright (c) 2018 Jonas Hübotter

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
