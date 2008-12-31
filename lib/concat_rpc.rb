require 'concat_rpc/person'
module ConcatRPC
  extend self

  def url=(url)
    require 'xmlrpc/client'
    @client = XMLRPC::Client.new2(url).proxy('')
  end
  
  def method_missing(name,*args)
    @client.send(name,*args)
  end
end