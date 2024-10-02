class SuspectsController < ApplicationController 
    before_action :set_suspect, only: [:show, :update, :destroy]
    before_action :check_login
    authorize_resource

    # Used copilot to generate this syntax
    def new
        @investigation = Investigation.find(params[:investigation_id])
        @current_suspects = @investigation.suspects.where(dropped_on: nil)
        @suspect = Suspect.new
    end

    def create
        @suspect = Suspect.new(suspect_params)
        if @suspect.save
            flash[:notice] = "Successfully added suspect."
            redirect_to investigation_path(@suspect.investigation)
        else
            @investigation = Investigation.find(@suspect.investigation_id)
            @current_suspects = @investigation.suspects.where(dropped_on: nil)
            render action: 'new'
        end
    end

    def terminate
        @suspect = Suspect.find(params[:id])
        @suspect.update_attribute(:dropped_on, Date.current)
        flash[:notice] = "Successfully terminated suspect."
        redirect_to investigation_path(@suspect.investigation)
    end

    private
    def set_suspect
        @suspect = Suspect.find(params[:id])
    end

    def suspect_params
        params.require(:suspect).permit(:criminal_id, :investigation_id, :added_on)
    end

end