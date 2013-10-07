class Annotation
  include Mongoid::Document
  include Mongoid::Timestamps
  
#  validates :role_language, :presence => { :message => "The language field cannot be blank." }
  scope :need_approval, where( :approved == true )
  
  field :name, type: String
  field :canonical_name, type: String
  field :role, type: String
  field :role_translation, :type => String
  field :role_language, :type => String
  field :approved, :type => Boolean, :default => true 
  field :comment

  embedded_in :note

  def note_id=(id)
     self.note = Note.find_by(:id => id)
  end


end
