require 'thrift'
require File.expand_path('../my_first_service', __FILE__)

class MyFirstHandler
  def initialize; end

  def log(filename)

  end

  def multiply(number1, number2)
    number1 * number2
  end

  def get_log_size(filename)
    100
  end

end

include Myfirst
handler = MyFirstHandler.new()
processor = MyFirstService::Processor.new(handler)
transport = Thrift::ServerSocket.new(8080)
transportFactory = Thrift::BufferedTransportFactory.new()
server = Thrift::SimpleServer.new(processor, transport, transportFactory)

print "Thrift server started..."
server.serve()

