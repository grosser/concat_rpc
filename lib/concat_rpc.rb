require 'concat_rpc/person'
module ConcatRPC
  extend self

  def url=(url)
    require 'xmlrpc/client'
    @client = XMLRPC::Client.new2(url)
    #TODO use proxy http://redhanded.hobix.com/inspect/theBestOfMethod_missing.html
  end

  def call(*args)
    @client.call('.'+args[0],*args[1..-1])
  end
end