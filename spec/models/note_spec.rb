require 'spec_helper'

describe Note do

  it "should get random records by annotation" do
    n = Note.create(:language => "english")
    Note.get_random_by_language("english").first.id.should == n.id
    n.annotations.create
    n.approved_counter += 1
    n.save    
    Note.get_random_by_language("english").first.id.should == n.id
    n.annotations.create
    n.approved_counter += 1
    n.save
    n.approved_counter.should == 2 
    Note.get_random_by_language("english").should == []
  end

  it "should return the authority names of the record" do
    record = Record.create(:authority_names => [ "Joe Smith", "Jane Doe" ])
    note = Note.create(:language => "english", :record_id => record.id)
    note.authority_names.should == record.authority_names
  end

end
