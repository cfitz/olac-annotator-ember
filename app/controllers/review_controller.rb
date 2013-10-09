require 'csv'
class ReviewController < ApplicationController

  
  def index
      respond_to do |format|
         format.html { render layout: 'review' }
       end
  end


  def search
    params[:page] ||= 1
    params[:per_page] ||= 20
    
    @notes =  Note.annotated.paginate(:page => params[:page], :per_page => params[:per_page])
    
    anno = @notes.collect { |n| n.annotations }
    @annotations = anno.flatten
    
    @csv = ""
    @csv << ["marc_record id", "note id", 'annotation id', 'creation date', "record title", "record language",  "credit", "annotated role language", "annotated name", 'annotated canonical name',  "annotated role", "annotated role translation", "approved", "comment" ].to_csv
    @annotations.each do |annotation| 
      marc_id = annotation.note.record.record_id 
      @csv << [marc_id, annotation.note.id , annotation.id, annotation.attributes['created_at'], annotation.note.record_title, annotation.note.language, annotation.note.text, annotation.role_language, annotation.name,
         annotation.canonical_name, annotation.role, annotation.role_translation, annotation.approved?, annotation.comment ].map { |c| c.to_s.encode("UTF-8") }.to_csv
    end  
    
     respond_to do |format|
       format.csv { render text: @csv }
       #format.html { render layout: false }
     end
  end
  
  
end
