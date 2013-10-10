require 'spec_helper'

describe Record do

  it "should set the authority name" do
    record = Record.create(:marc_hash => JSON.parse( IO.read ( Rails.root.join("spec/fixtures/marchash.json") )) )
    record.authority_names.should == [{:name=>"Close, Glenn,", :field=>"700-000", :record_id=>nil}, {:name=>"Irving, Washington,", :field=>"700-002", :record_id=>nil}, {:name=>"Rabbit Ears Productions", :field=>"710-000", :record_id=>nil}, {:name=>"Van Nutt, Robert", :field=>"700-001", :record_id=>nil}]

  end

end
