#!/usr/bin/env ruby
require 'bundler'
Bundler.require

name = Etc.getlogin

ctx = ZMQ::Context.new
listener = ctx.socket(ZMQ::SUB)
(2..254).each do |address|
  listener.connect("tcp://192.168.43.#{address}:7315")
end
listener.setsockopt(ZMQ::SUBSCRIBE, '')

Thread.new do
  loop do
    s = ''
    listener.recv_string(s)
    puts "#{s.strip}"
  end
end.run

talker = ctx.socket(ZMQ::PUB)
talker.bind("tcp://192.168.43.159:7315")

loop do
  talker.send_string("<#{name}> #{gets}")
end


#83.218.151.42
#10.151.2.106
