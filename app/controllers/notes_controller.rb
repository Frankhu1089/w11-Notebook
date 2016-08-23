class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note
    else
      render "new"
    end
  end

  def edit
  end

  def update

    if @note.update(note_params)
      redirect_to @note
    else
      render "edit"
    end
  end

  def destroy
    @note.destroy
    redirect_to root_path, notice: "Successfully deleted notes"
  end

  private

  def find_note
    @note = Note.find(note_params[:id])
  end

  def note_params
    params.require(:notes).permit(:title, :content)
  end
end
