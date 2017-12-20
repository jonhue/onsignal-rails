# Changelog

### master

* nothing yet

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
