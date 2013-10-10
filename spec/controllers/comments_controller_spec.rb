require 'spec_helper'

describe CommentsController do

  describe "#create" do
      
    it 'raises an exception without a raw parametere' do
      lambda { xhr :post, :create }.should raise_error(ActionController::ParameterMissing)
    end

    it 'returns JSON of the post' do
      xhr :post, :create, { comment: {  text: 'test', commentersName: "joey jo" } }
      ::JSON.parse(response.body).should be_present
    end

  end

end
