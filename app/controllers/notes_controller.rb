class NotesController < ApplicationController
    before_action :set_note, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    
    def index
      @notes = Note.all
    end
    
    def new
      @note = Note.new
    end
    
    def create
      @note = Note.new(note_params)
      if @note.save
        redirect_to @note, notice: "Note saved successfully"
      else
        render :new
      end
    end
    
    def show
    end
  
    def edit
    end
  
    def update
      if @note.update(note_params)
        redirect_to @note, notice: "Note saved successfully"
      else
        render :edit
      end 
    end

    def destroy
        @note.destroy
        redirect_to notes_url, notice: "Notes were destoyed successfully"
    end    
    private
    
    def set_note
      @note = Note.find(params[:id])
    end
    
    def note_params
      params.require(:note).permit(:title, :content, :user_id)
    end
  end
  