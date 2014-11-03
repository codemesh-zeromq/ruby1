require 'bundler'
Bundler.require

context = ZMQ::Context.new
socket = context.socket(ZMQ::REP)
socket.bind("tcp://*:7313")
id = ARGV.first
puts "server id: #{id}"

loop do
	request = ''
	socket.recv_string(request)
	puts "Received '#{request}'"
	if request =~ /^hello$/i
		socket.send_string "world (#{id})"
		puts "Sending 'world'"
	else
		socket.send_string "nada (#{id})"
		puts "Nope"
	end
end
