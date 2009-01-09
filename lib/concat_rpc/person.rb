module ConcatRPC
  class Person
    require 'activesupport'
    class_inheritable_accessor :defaults
    self.defaults = {'gender'=>0,'lname'=>'UNKNOWN'}

    def self.find(id)
      new(ConcatRPC.show_person(id))
    end

    def self.find_by_text(text)
      person = ConcatRPC.find_person(text).first
      return nil if person.blank?
      find(person['id'])
    end

    def self.tag(id,tag)
      ConcatRPC.set_tag(id,tag)
    end

    def self.untag(id,tag)
      ConcatRPC.unset_tag(id,tag)
    end

    def initialize(data={})
      @data = data.stringify_keys
    end

    def save!
      self.id = ConcatRPC.create_person(self.class.defaults.merge(@data))
      self
    end

    def id
      @data['id'].to_i
    end

    def method_missing(name,value=nil)
      name = name.to_s
      if name =~ /(.*)=$/
        @data[$1]=value
      else
        return @data[name] if @data.key?(name)
        super
      end
    end

    def respond_to?(name)
      @data.key?(name.to_s) || super
    end
  end
end