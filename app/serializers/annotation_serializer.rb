class AnnotationSerializer < ActiveModel::Serializer
  attributes :id,  :name, :role, :role_translation, :role_language, :approved
   
   def id
     object.to_param
   end

end
