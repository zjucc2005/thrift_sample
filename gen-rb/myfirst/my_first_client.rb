require 'thrift'
require File.expand_path('../my_first_service', __FILE__)

include Myfirst

transport = Thrift::BufferedTransport.new(Thrift::Socket.new('localhost', '8080'))
protocol = Thrift::BinaryProtocol.new(transport)
client = MyFirstService::Client.new(protocol)

transport.open()  # start socket

# get response
client.log("thrift_client.log")
print client.multiply(3, 4)

transport.close() # end socket