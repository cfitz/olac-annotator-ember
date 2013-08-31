class NotesController < ApplicationController
  respond_to :json
  
  
  def index
    if params[:random] == "true"
      respond_with Note.get_random_by_language(params[:language])
    elsif params[:ids]
      respond_with Note.where(:_id.in => params[:ids]).all.to_a
    else
      respond_with Note.limit(5)
    end
   end
  
  
  
  def show
    respond_with Note.find(params[:id])
  end
  
  
end