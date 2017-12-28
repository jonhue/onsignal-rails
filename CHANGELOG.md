# Changelog

### master

* nothing yet

### 3.1.1 - 2017-12-28

* bugfixes
    * fix `has_devices` method

### 3.1.0 - 2017-12-27

* features
    * add `has_devices` method

### 3.0.2 - 2017-12-21

* bugfixes
    * fixed `undefined method 'set_device_owner' for ApplicationController:Class`

### 3.0.1 - 2017-12-21

* bugfixes
    * custom `set_device_owner` method was not overriding default

### 3.0.0 - 2017-12-21

* features
    * made Devise optional
    * added `owner` association to `Device` model
* enhancements
    * renamed elements of the javascript API

### 2.0.1 - 2017-12-20

* bugfixes
    * fixed `undefined method 'permission=' for #<Device>`

### 2.0.0 - 2017-12-19

* features
    * automatically include helpers and concerns
    * configuration by passing a block to `configure`
    * introducing `Device` activerecord model
* enhancements
    * rename `current_onesignal` method to `current_device`

### 1.2.1 - 2017-12-18

* enhancements
    * add more configuration options

### 1.1.1 - 2017-12-18

* bugfixes
    * fixed use of wrong class name

### 1.1.0 - 2017-12-18

* enhancements
    * dont't include keys in `current_onesignal` hash whose values are `nil`

### 1.0.1 - 2017-12-18

* bugfixes
    * fixed `Stack Level too deep` when using `current_onesignal`

### 1.0.0 - 2017-12-18

* initial release
