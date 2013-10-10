require 'spec_helper'

describe AnnotationsController do
  describe "#create" do
      
    it 'raises an exception without a raw parametere' do
      lambda { xhr :post, :create }.should raise_error(ActionController::ParameterMissing)
    end

    it 'returns JSON of the post' do
      note = Note.create
      xhr :post, :create, { annotation: {  name: 'test', canonical_name: "joey jo", note_id: note.id } }
      ::JSON.parse(response.body).should be_present
    end

  end

end
