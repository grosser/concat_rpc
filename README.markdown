Concat API
==========
 - AR-like Concat - Person abstraction

INSTALL
=======

    sudo gem install grosser-concat_rpc

USAGE
=====

    require 'rubygems'
    require 'concat_rpc'
    ConcatRPC.url = 'http://USERNAME:PASSWORD@HOST/concat/rpc/index'

    p = ConcatRPC::Person.new(:cmail=>'my email',:gender=>2)
    p.save!
    p.pemail = 'my personal mail'
    p.save!.id == ConcatRPC::Person.find_by_text(p.cemail).id
    ConcatRPC::Person.untag(p.id,'Foo')
    ConcatRPC::Person.tag(p.id,'Bar')

AUTHOR
======
Michael Grosser
grosser.michael@gmail.com
Hereby placed under public domain, do what you want, just do not hold me accountable...