module Api::V1
  class InvestigationsController < ApiController
    before_action :set_investigation, only: [
      :detail,
      :new_note,
      :new_suspect,
      :new_crime_investigation,
      :update,
      :add_assignment,
      :delete_crime_investigation
    ]

    def index
      @investigations = Investigation.active.chronological.all
      # render json: InvestigationSerializer.new(@investigations).serialized_json
    end

    def detail
      # @current_assignments = @investigation.assignments.current.by_officer
      render json: InvestigationDetailSerializer.new(@investigation)
    end

    def update
      @investigation.update(investigation_params)
      if params[:investigation_closed]
        @investigation.date_closed = Date.current
      end
      @investigation.save
      render json: InvestigationDetailSerializer.new(@investigation)
    end

    def officer_search
      text = params[:text]
      render json: { officers: Officer.search(text).map {|officer| OfficerSerializer.new(officer)} }
    end

    def criminals_search
      text = params[:text]
      render json: { criminals: Criminal.search(text).map {|criminal| CriminalSerializer.new(criminal)} }
    end

    def new_note
      @investigation_note = InvestigationNote.new(investigation_note_params)
      @investigation_note.officer = current_user
      @investigation_note.investigation = @investigation
      @investigation_note.date = Date.current
      @investigation_note.save
      render json: InvestigationNoteSerializer.new(@investigation_note)
    end

    def add_assignment
      @assignment = Assignment.new(assignment_params)
      @assignment.investigation = @investigation
      @assignment.start_date = Date.current
      @assignment.save
      render json: AssignmentSerializer.new(@assignment)
    end

    def end_assignment
      @assignment = Assignment.find(params[:id])
      @assignment.end_date = Date.current
      @assignment.save
      render json: AssignmentSerializer.new(@assignment)
    end

    def drop_suspect
      @suspect = Suspect.find(params[:id])
      @suspect.dropped_on = Date.current
      @suspect.save
      render json: SuspectSerializer.new(@suspect)
    end

    def crimes
      render json: { crimes: Crime.alphabetical.all.map {|crime| CrimeSerializer.new(crime)} }
    end

    def new_suspect
      @suspect = Suspect.new(suspect_params)
      @suspect.added_on = Date.current
      @suspect.investigation = @investigation
      @suspect.save
      render json: SuspectSerializer.new(@suspect)
    end

    def new_crime_investigation
      @crime_investigation = CrimeInvestigation.new(crime_investigation_params)
      @crime_investigation.investigation = @investigation
      @crime_investigation.save
      # return json of the associated crime
      render json: CrimeSerializer.new(@crime_investigation.crime)
    end

    def delete_crime_investigation
      @crime = Crime.find(params[:crime_id])
      @crime_investigation = CrimeInvestigation.for_crime(@crime).for_investigation(@investigation).first # there should only be one at most
      return true if @crime_investigation.nil?
      if @crime_investigation.destroy
        render json: { message: "success!" }
      else
        render json: { errors: @crime_investigation.errors.messages }, status: 500
      end
    end

    def show
      @investigation = Investigation.find(params[:id])
      render json: InvestigationSerializer.new(@investigation).serialized_json
    end

    private

    def assignment_params
      params.require(:assignment).permit(:officer_id)
    end

    def investigation_params
      params.require(:investigation).permit(:description, :crime_location, :solved, :batman_involed)
    end

    def investigation_note_params
      params.require(:investigation_note).permit(:content)
    end

    def suspect_params
      params.require(:suspect).permit(:criminal_id)
    end

    def crime_investigation_params
      params.require(:crime_investigation).permit(:crime_id)
    end

    def set_investigation
      @investigation = Investigation.find(params[:id])
    end
  end
end
