class Api::V1::NotesController < ApplicationController
  before_action :authenticate_admin_user!
  skip_forgery_protection

  def create
    @note = current_admin_user.notes.new(note_params)

    if @note.valid? && @note.save
      render :create, status: :ok
    else
      render json: @note.errors, status: :unprocessable_entity
    end
  end 

  private

  def note_params
    params.require(:note).permit(:name, :time, :description)
  end
end
