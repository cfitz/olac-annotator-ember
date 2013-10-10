require 'spec_helper'

describe NotesController do
    let(:record) { Record.create(:authority_names => [ "Joe Smith", "Jane Doe" ]) }
    let(:note) { Note.create(:language => "english", :record_id => record.id) }


  describe "#show" do
    
    it 'succeeds' do
      xhr :get, :show, id: note.id
      response.should be_success
      ::JSON.parse(response.body).should be_present

    end

  end

  describe "#index" do
    it "should index notes" do
      xhr :get, :index
      response.should be_success
      ::JSON.parse(response.body).should be_present
    end

    it "gets a random record" do
      allow(note).to receive(:get_random_by_language).with('english') { note }
      xhr :get, :index, { random: "true" , language: 'english' }
      response.should be_success
      ::JSON.parse(response.body).should be_present 
    end

    it "should index records if given a list of ids" do
      xhr :get, :index, { ids: [note.id] }
      response.should be_success
      ::JSON.parse(response.body).should be_present 
    end


  end

end
