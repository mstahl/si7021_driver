# Si7021

Use this gem to talk to Si7021 temperature/humidity sensors.

* You should read the [datasheet](http://www.silabs.com/documents/public/data-sheets/Si7021-A20.pdf)
  to learn about the Si7021 sensor's capabilities
* Connect your Si7021 to the I2C bus on your computer
* Make sure your kernel is compiled with I2C support; if you have no idea
  what that means, [go do some reading first](http://www.thegeekstuff.com/2013/06/compile-linux-kernel)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'si7021'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install si7021

## Usage

You can read temperature and humidity with the `Si7021` module:

    irb(main):001:0> Si7021::Temperature.read
    => 21.1230949
    irb(main):002:0> Si7021::Temperature.fahrenheit
    => 70.02
    irb(main):002:0> Si7021::Humidity.read
    => 51.13

If you've already read the humidity, the sensor reads the temperature at the
same time in order to perform a calculation to determine relative humidity. You
can get this cached value with the `#read_stored` method.

    irb(main):001:0> Si7021::Temperature.read_stored
    => 21.1230949

If you try to read the stored temperature without having measured humidity
first, rather than take a new temperature measurement, which might take more
time, the module will fail immediately with a `TemperatureNotStored` exception.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/[USERNAME]/si7021. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Si7021 project’s codebases, issue trackers, chat
rooms and mailing lists is expected to follow the [code of
conduct](https://github.com/[USERNAME]/si7021/blob/master/CODE_OF_CONDUCT.md).
