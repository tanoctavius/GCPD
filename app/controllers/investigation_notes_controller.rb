class InvestigationNotesController < ApplicationController
    before_action :set_investigation_note, only: [:terminate]
    before_action :check_login
    authorize_resource

    def new
        @investigation_note = InvestigationNote.new
        @investigation = Investigation.find(params[:investigation_id])
    end

    def create
        @investigation_note = InvestigationNote.new(investigation_note_params)
        if @investigation_note.save
            flash[:notice] = "Successfully added investigation note."
            redirect_to investigation_path(@investigation_note.investigation)
        else
            @investigation = Investigation.find(@investigation_note.investigation_id)
            render action: 'new', locals: { investigation: @investigation }
        end
    end

    private

    def set_investigation_note
        @investigation_note = InvestigationNote.find(params[:investigation_note_id])
    end

    def investigation_note_params
        params.require(:investigation_note).permit(:investigation_id, :officer_id, :content)
    end

end
