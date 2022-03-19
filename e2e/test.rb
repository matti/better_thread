require_relative "../lib/better_thread"

bt_normal = BetterThread.new do
  puts "normal"
end

bt_normal.join

bt_timeout = BetterThread.new timeout: 0.3 do
  loop do
    puts "timeout"
    sleep 0.1
  end
end

bt_timeout.join
raise "timeout?" unless bt_timeout.timeout?

bt_raise = BetterThread.new timeout: 0.5 do
  raise "wat"
rescue
  puts "rescued"
end

bt_raise.join

puts "OK"
