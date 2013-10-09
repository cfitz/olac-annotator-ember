class Note
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::MagicCounterCache
  
  
  field :text, type: String
  field :language, type: String # this is the lang from the filename
  field :marc_language, type: String # this is lang from the 008 field
  
  field :input_field, type: String
  field :record_title, type: String
  
  
  
  field :approved_counter, :type => Integer, :default => 0
  field :needs_approved_counter, :type => Integer, :default => 0
  
  index({ language: 1 }, { unique: false })
  index 'annotations.role_language' => 1  
  belongs_to :record
  embeds_many :annotations
  embeds_many :comments
  
  attr_accessor :randomized
  
  def authority_names
    record.authority_names
  end
  
  before_save :update_approved_counter 
  scope :needs_approval, where(:needs_approved_counter.gt => 0 ).order_by(:need_approved_counter => :asc)
  scope :annotated, where(:approved_counter.gt => 0).order_by(:created_at => :asc )  
  
  protected
  
  
  def update_approved_counter
    self.approved_counter = 0 
    self.needs_approved_counter = 0
    self.annotations.each { |a|  a.approved? ? self.approved_counter += 1 : self.needs_approved_counter += 1  }  
  end
  
  
  # When we are in annotation mode, we want a random record without an annotations. 
  def self.get_random_by_language(language)
    records = Note.where(language: language, :approved_counter.lt => 2)
    cnt = ( records.count - 1 ) 
    offset = rand(cnt)
    records.skip(offset).limit(1).map { |r| r.randomized = true; r }
  end
  
  
  
  
end
