# Location

According to the China city/county to get the latitude and longitude and zip code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'china_location'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install Chinalocation

## Usage

```ruby
ChinaLocation.search("河北省", "唐山市")
=> {:prov=>"河北省", :city=>"唐山市", :county=>"唐山市", :longitude=>"118.2", :latitude=>"39.63", :code=>"063000", :is_accurate=>true}

ChinaLocation.search("河北省", "唐山市", "玉田县")
=> {:prov=>"河北省", :city=>"唐山市", :county=>"玉田县", :longitude=>"117.73", :latitude=>"39.88", :code=>"064100", :is_accurate=>true}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/location. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
