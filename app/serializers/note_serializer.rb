class NoteSerializer < ActiveModel::Serializer
  attributes :id,  :language, :input_field, :record_title, :text, :authority_names, :marc_language
   has_many :annotations 
   
   def id
     object.to_param
   end
   
   def include_annotations?
     !object.randomized
   end
   
end
