require 'bundler'
Bundler.require

context = ZMQ::Context.new
socket = context.socket(ZMQ::REP)
socket.bind("tcp://*:7313")
id = ARGV.first
puts "server id: #{id}"
<<<<<<< HEAD
=======

>>>>>>> 234d55165e6b32e48e213f88961cc798a6696ec2
loop do
	request = ''
	socket.recv_string(request)
	puts "Received '#{request}'"
	if request =~ /^hello$/i
		socket.send_string "world (from #{id})"
		puts "Sending 'world'"
	else
		socket.send_string "nada (from #{id})"
		puts "Nope"
	end
end
