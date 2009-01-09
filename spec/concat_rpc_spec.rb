require File.expand_path("spec_helper", File.dirname(__FILE__))
credentials = open(File.join(File.dirname(__FILE__),'credentials'))
URL = "http://#{credentials}@monty/concat/rpc/index"

include ConcatRPC

describe ConcatRPC do
  PERSON_ID = 77487
  PERSON_EMAIL = 'nenew@watchothers.com'
  before do
    ConcatRPC.url = URL
  end
  it("does not crash"){}
  describe :find do
    it "finds by id" do
      Person.find(PERSON_ID).id.should == PERSON_ID
    end
  end
  describe :find_by_text do
    it "finds a person by email" do
      Person.find_by_text(PERSON_EMAIL).id.should == PERSON_ID
    end
    it "returns nil for unfound persons" do
      Person.find_by_text('adsaadsadsaswwwddssdsdsdadadsdas').should == nil
    end
  end
  describe 'tagging' do
    before do
      Person.untag(PERSON_ID,'testing_tagging')
    end
    it "tags a person" do
      Person.tag(PERSON_ID ,'testing_tagging')
      Person.find(PERSON_ID).tags_as_text.should =~ /testing_tagging/
    end
    it "untags a person" do
      Person.tag(PERSON_ID ,'testing_tagging')
      Person.untag(PERSON_ID ,'testing_tagging')
      Person.find(PERSON_ID).tags_as_text.should_not =~ /testing_tagging/
    end
    it "untags a duplicate taged person" do
      Person.tag(PERSON_ID ,'testing_tagging')
      Person.tag(PERSON_ID ,'testing_tagging')
      Person.tag(PERSON_ID ,'testing_tagging')
      Person.untag(PERSON_ID ,'testing_tagging')
      Person.find(PERSON_ID).tags_as_text.should_not =~ /testing_tagging/
    end
  end
  describe :save! do
    it "can save a empty record and stores the id" do
      Person.new().save!.id.should > PERSON_ID
    end
    it "creates a person using defaults" do
      p = Person.new()
      defaults = Person.defaults
      Person.stubs(:defaults).returns(defaults.merge(:cemail=>'ydadada@sdsds.dd'))
      p.save!
      Person.find(p.id).cemail.should == "ydadada@sdsds.dd"
    end
    it "creates a person with attributes" do
      p = Person.new(:cemail=>"hans_peter@fuu.de")
      p.save!
      Person.find(p.id).cemail.should == "hans_peter@fuu.de"
    end
    it "does not overwrite attributes with defaults" do
      p = Person.new(:cemail=>"hans_peter@fuu.de",:gender=>2)
      p.save!
      Person.find(p.id).gender.should == "2"
    end
    it "updates an existing person without crreating a new" do
      person = Person.new.save!
      lambda{person.save!}.should_not change(person,:id)
    end
    it "saves new attributes when updating" do
      person = Person.new.save!
      person.cemail = 'asdadaadsas@dssdfddf.dd'
      person.save!
      Person.find(person.id).cemail.should == 'asdadaadsas@dssdfddf.dd'
    end
  end
end