require 'bundler'
Bundler.require

context = ZMQ::Context.new
announcer = context.socket(ZMQ::PUB)

(1..253).each do |address|
  announcer.connect("tcp://192.168.43.#{address}:7314")
end

loop do
  puts "sending #{ARGV[0]}"
  announcer.send_string(ARGV[0])
  sleep 1
end
