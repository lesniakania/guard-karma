# Guard::Karma

Guard plugin for [Karma](http://karma-runner.github.io/0.12/index.html).
Unfortunatelly I couldn't find a way to run specific test file, so it runs them all, but it's still useful for me.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'guard-karma'
```

And then execute:

```
bundle
```

Or install it yourself as:

```
gem install guard-karma
```

## Usage

```
guard init guard-karma
```

Supported options:
- `cmd` - command which will be run on each change; by default `./bin/karma` is used, you can put there e. g.:
```bash
#!/bin/bash

./node_modules/karma/bin/karma start spec/karma.conf.coffee --single-run
```
- `all_on_start` - when true, tests will be run on guard start


## Contributing

1. Fork it ( https://github.com/[my-github-username]/guard-karma/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
