class CrimeInvestigationsController < ApplicationController
    before_action :set_crime_investigation, only: [:show, :edit, :update, :destroy]
    before_action :check_login
    authorize_resource

    # Used copilot to generate this syntax
    def new
        @crime_investigation = CrimeInvestigation.new
        @investigation = Investigation.find(params[:investigation_id])
        @crimes_list = Crime.all - @investigation.crimes
    end

    def create
        @crime_investigation = CrimeInvestigation.new(crime_investigation_params)
        if @crime_investigation.save
            flash[:notice] = "Successfully added #{@crime_investigation.crime.name} to #{@crime_investigation.investigation.title}."
            redirect_to investigation_path(CrimeInvestigation.last.investigation)
        else
            render action: 'new', locals: { investigation: @crime_investigation.investigation, crimes_list: @crimes_list }
        end
    end

    def destroy
        @crime_investigation.destroy
        flash[:notice] = "Successfully removed a crime from this investigation."
        redirect_to investigation_path(@crime_investigation.investigation)
    end

    private

    def set_crime_investigation
        @crime_investigation = CrimeInvestigation.find(params[:id])
    end

    def crime_investigation_params
        params.require(:crime_investigation).permit(:crime_id, :investigation_id)
    end

end