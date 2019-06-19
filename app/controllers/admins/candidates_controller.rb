class Admins::CandidatesController < Admins::BaseController
  before_action :load_candidate, only: :contact

  def index
    @candidates = Candidate.order_by_contact_status
  end

  def contact
    if @candidate.update contact_status: params[:contact_status]
      flash[:success] =
        if @candidate.contacted?
          t(".contacted_success", candidate: @candidate.name)
        else
          t(".not_contact_success", candidate: @candidate.name)
        end
    else
      flash[:danger] =
        if @candidate.contacted?
          t(".contacted_failure", candidate: @candidate.name)
        else
          t(".not_contact_failure", candidate: @candidate.name)
        end
    end

    redirect_to admins_candidates_path
  end

  def create
    @candidate = Candidate.new candidate_params

    if @candidate.save
      flash[:success] = t ".success"

      ContactMailer.contact_email().deliver 
    else
      flash[:danger] = t ".failure"
    end

    redirect_to root_path
  end

  private

  def candidate_params
    params.require(:candidate).permit :name, :email, :phone_number, :website, :content
  end

  def load_candidate
    @candidate = Candidate.find_by id: params[:id]

    flash[:danger] = t("record.not_found", object_name: Candidate.name) unless @candidate
  end
end
