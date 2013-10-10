class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text,  :commentersName
  
   def id
     object.to_param
   end

end
