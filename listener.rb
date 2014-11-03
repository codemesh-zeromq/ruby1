require 'bundler'
Bundler.require

context = ZMQ::Context.new
listener = context.socket(ZMQ::SUB)
listener.bind("tcp://*:7314")
listener.setsockopt(ZMQ::SUBSCRIBE, '')

loop do
  s = ''
  listener.recv_string(s)
  p s
end
