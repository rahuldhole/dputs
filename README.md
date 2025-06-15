# dputs

Provides global debug print methods (`dputs`, `dp`, `dprint`, `dpp`) that display variable names along with their values for easier debugging in Ruby.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add dputs
````

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install dputs
```

````

## Usage

After requiring the gem (`require 'dputs'`), you can use:

```ruby
my_var = 123
dputs my_var   #=> my_var: 123
dp my_var      #=> my_var: 123
dprint my_var  #=> my_var: 123 (no newline)
dpp my_var     #=> my_var: 123 (pretty printed)
dap nums       #=> nums:
                        [
                            [0] 3,
                            [1] 4,
                            [2] 5,
                            [3] 1,
                            [4] 2
                        ]
````

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that allows you to experiment.

To install this gem onto your local machine, run:

```bash
bundle exec rake install
```

To release a new version, update the version number in `lib/dputs/version.rb`, and then run:

```bash
bundle exec rake release
```

which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/rahuldhole/dputs](https://github.com/rahuldhole/dputs). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/rahuldhole/dputs/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Dputs project's codebases, issue trackers, chat rooms, and mailing lists is expected to follow the [code of conduct](https://github.com/rahuldhole/dputs/blob/main/CODE_OF_CONDUCT.md).
