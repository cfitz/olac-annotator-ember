require 'spec_helper'

describe Note do

  it "should get random records by annotation" do
    n = Note.create(:language => "english")
    Note.get_random_by_language("english").first.id.should == n.id
    n.annotations.create
    n.save
    Note.get_random_by_language("english").first.id.should == n.id
    n.annotations.create
    n.save
    Note.get_random_by_language("english").should == []



  end


end
