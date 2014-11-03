#!/usr/bin/env ruby
require 'bundler'
Bundler.require

ctx = ZMQ::Context.new
subscriber = Thread.new do |t|
	listener = ctx.socket(ZMQ::SUB)
	listener.bind("tcp://*:7315")
	listener.setsockopt(ZMQ::SUBSCRIBE, '')

	loop do
		s = ''
		listener.recv_string(s)
		puts "Received: '#{s.strip}'"
	end
end
subscriber.run

talker = ctx.socket(ZMQ::PUB)
(1..254).each do |address|
  talker.connect("tcp://192.168.43.#{address}:7315")
end

loop do
	msg = gets
	talker.send_string(msg)
end
#83.218.151.42
#10.151.2.106
