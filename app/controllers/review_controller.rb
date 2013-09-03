class ReviewController < ApplicationController

  
  def index
      respond_to do |format|
         format.html { render layout: 'review' }
       end
  end


  def search
    params[:page] ||= 1
    params[:per_page] ||= 20
    
    @notes =  Note.needs_approval.paginate(:page => params[:page], :per_page => params[:per_page])
    anno = @notes.collect { |n| n.annotations }
    @annotations = anno.flatten
  
    csv = [["note id", "record title", "record language",  "credit", "annotated role language", "annotated name", 'annotated canonical name',  "annotated role", "annotated role translation", "approved" ]]
    @annotations.each do |annotation|  
      csv << [annotation.note.id , annotation.note.record_title, annotation.note.language, annotation.note.text, annotation.role_language, annotation.name, annotation.canonical_name, annotation.role, annotation.role_translation, annotation.approved? ]
    end  
    
    @csv = ""
    csv.each { |cs|  @csv << cs.to_csv  }
    
    #render text: @csv, layout: false, content_type: "text/plain"
  
     respond_to do |format|
       format.csv { render text: @csv }
       #format.html { render layout: false }
     end
  end
  
  
end