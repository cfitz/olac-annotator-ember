class AnnotationsController < ApplicationController
  respond_to :json

  def create
    a = Annotation.create(annotation_params)
    respond_with a, status: :ok
  end
  
  private
  
  def annotation_params
    params.require(:annotation).permit(:name, :canonical_name, :role, :role_translation, :role_language, :comment, :note_id, :approved )
  end

end
