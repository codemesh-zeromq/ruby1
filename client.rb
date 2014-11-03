require 'bundler'
Bundler.require

# opts = Trollop::options do
# 	opt :ip, 'IPv4 of server', default: '127.0.0.1'
# end

context = ZMQ::Context.new
requester = context.socket(ZMQ::REQ)
puts "sending to #{ARGV.first}"
requester.connect("tcp://#{ARGV.first}:7313")

requester.send_string "foo"
reply = ''
requester.recv_string(reply)
puts "Received back '#{reply}'"


requester.send_string "hello"
reply = ''
requester.recv_string(reply)
puts "Received back '#{reply}'"

exit 0
