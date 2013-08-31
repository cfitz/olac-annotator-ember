class Record
  include Mongoid::Document
    
  field :marc_hash, type: Hash
  field :title, type: String
  field :record_id, type: String
  field :language, :type => String

  field :authority_names, :type => Array
  before_validation :set_authority_names

  has_many :notes
  
  index({ language: 1 }, { unique: false })
  
  def to_marc
    self.marc_hash ? convert_hash_to_marc(self.marc_hash)   : ""
  end
  
  
  protected
  
  def set_authority_names
     unless self.marc_hash.nil?
        results = []
        marc = MARC::Record.new_from_marchash(self.marc_hash)
        [ "100", "700"].each do |field|
           marc.fields(field).each_with_index do |str, index|
               results << { :name => str["a"].chomp("."), :field => "#{field}-00#{index.to_s}", :record_id => self.record_id }
           end
        end

        [ "110", "710"].each do |field|
            marc.fields(field).each_with_index do |str, index|
              if str['a']
                name = "#{str['a'].chomp('.')}"
                name << " -- #{str['b'].chomp('.')}" if str['b']
                results << { :name => name, :field => "#{field}-00#{index.to_s}", :record_id => self.record_id }
              end
            end
         end

        self.authority_names = results.sort_by { |r| r[:name] }
     end
   end
  
   def ensure_marc_hash
      if marc_string.blank?
         self.marc_hash = MARC::Reader.new(Rails.root.join("doc/sample.mrc").to_s).first.to_marchash
       else
         self.marc_hash = MARC::Reader.new(StringIO.new(marc_string)).first.to_marchash
       end
   end
  
  
  
  

end
