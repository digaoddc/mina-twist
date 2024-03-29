# Mina::Twist

This is a Twist plugin for [mina](https://github.com/mina-deploy/mina)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mina-twist'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install mina-twist
```

## Usage

in `deploy.rb`

```
require 'mina/twist'

task deploy: :environment do
  deploy do
    ...
    isolate do
      invoke 'twist:starting'
      # Deploy Commands
      invoke 'twist:finished'
    end
  end
  
  deploy do
    ...
    isolate do
      invoke 'twist:starting_restart'
      # Restart Commands
      invoke 'twist:finished_restart'
    end
  end
end
```

## Configuration

These are the settings you can set:
```
set :twist_url, 'https://twist.com/api/v3/integration_incoming/post_data?install_id=xxx&install_token=xxx'
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mina-deploy/mina-twist. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

T
