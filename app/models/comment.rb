class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MagicCounterCache
  
  
  field :text, type: String
  field :commentersName, type: String
  
  belongs_to :note
  
end