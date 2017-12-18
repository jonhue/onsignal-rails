# devise-onesignal

[![Gem Version](https://badge.fury.io/rb/devise-onesignal.svg)](https://badge.fury.io/rb/devise-onesignal) <img src="https://travis-ci.org/jonhue/devise-onesignal.svg?branch=master" />

Implement user targeted cross-platform notifications with OneSignal & Devise in your Rails app.

---

## Table of Contents

* [Installation](#installation)
* [Usage](#usage)
* [To Do](#to-do)
* [Contributing](#contributing)
    * [Contributors](#contributors)
* [License](#license)

---

## Installation

`devise-onesignal` works with Rails 4.0 onwards. You can add it to your `Gemfile` with:

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

    $ rails g devise_one_signal

To wrap things up, migrate the changes into your database:

    $ rails db:migrate

**Note:** Use `rake db:migrate` instead if you run Rails < 5.

## Usage

First of all [create your OneSignal app](https://onesignal.com) and set your application ID in the created initializer (`config/initializers/devise-onesignal.rb`).

Now let's include the neccessary javascript files in our application (`apps/assets/javascripts/application.js`):

```js
//= require OneSignalSDK
//= require devise-onesignal
```

As a last step initialize the javascript component when your assets load. If you are using Rails 5 with Turbolinks, this could look like this:

```js
document.addEventListener( 'turbolinks:load', function() {
    OneSignalInit();
});
```

### Subscribing / unsubscribing users

This gem makes it fairly easy to subscribe and unsubscribe users from OneSignal. Just call the respective JavaScript function:

```js
OneSignalSubscribe();
OneSignalUnsubscribe();
```

### Backend

devise-onesignal introduces an `current_onesignal` method available in your controllers and views. It returns a hash:

```ruby
$ current_onesignal
{id: 'e9b66bc5-a1e5-4f3f-8a3e-894f576b193a', permission: 'allow', user: UserObject}
```

**Note:** When no user is associated with that ID, the returned hash does not include the key.

**Note:** If the user has not enabled OneSignal yet, the hash won't return an ID / user but it still returns the permission. In this case `denied` or `default`.

You can access the OneSignal PlayerId and Permission from the User object:

```ruby
$ User.first.onesignal_id
'e9b66bc5-a1e5-4f3f-8a3e-894f576b193a'
$ User.first.onesignal_permission
'allow'
```

---

## Configuration

| Option              | Description                                                           | Default |
| ------------------- | --------------------------------------------------------------------- | ------- |
| `app_id` (required) | OneSignal application ID                                              | `nil`   |
| `devise_class`      | Devise class                                                          | `User`  |
| `auto_register`     | Whether or not the app should automatically try to subscribe the user | `false` |

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
