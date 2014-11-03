require 'bundler'
Bundler.require

context = ZMQ::Context.new
requester = context.socket(ZMQ::REQ)
requester.connect("tcp://localhost:7313")
puts "sending"

requester.send_string "foo"
reply = ''
requester.recv_string(reply)
puts "Received back '#{reply}'"


requester.send_string "hello"
reply = ''
requester.recv_string(reply)
puts "Received back '#{reply}'"

exit 0
