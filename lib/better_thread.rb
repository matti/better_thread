# frozen_string_literal: true

require "forwardable"

class BetterThread
  extend Forwardable

  def_delegators :@thread, :join

  def initialize(opts = {}, &block)
    @timeout = false

    __better_thread_killer opts[:timeout] if opts[:timeout]
    @thread = ::Thread.send :new, &block
  end

  def timeout?
    @timeout
  end

  private

  def __better_thread_killer(timeout)
    @killer = Thread.new do
      started_at = Time.now
      loop do
        raise StopIteration unless @thread&.alive?

        if Time.now - started_at > timeout
          @timeout = true
          break
        end

        sleep 0.1
      end

      @thread&.kill if @timeout
    end
  end
end
