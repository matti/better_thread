# BetterThread

[Thread](https://ruby-doc.org/core-2.5.0/Thread.html) with timeout

```ruby
bt = BetterThread.new timeout: 3 do
  sleep 5
end

bt.join # joins after 3 seconds

bt.timeout? # true

```
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'better_thread'
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/matti/better-thread

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
