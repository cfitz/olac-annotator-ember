class CommentSerializer < ActiveModel::Serializer
  attributes :text,  :commentersName
  
   def id
     object.to_param
   end

end
