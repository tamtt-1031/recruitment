class Admins::ClientsController < Admins::BaseController
  skip_before_action :authenticate_admin!, only: :create
  before_action :load_client, only: :contact

  def index
    @clients = Client.order_by_contact_status
  end

  def contact
    if @client.update contact_status: params[:contact_status]
      flash[:success] =
        if @client.contacted?
          t(".contacted_success", client: @client.company_name)
        else
          t(".not_contact_success", client: @client.company_name)
        end
    else
      flash[:danger] =
        if @client.contacted?
          t(".contacted_failure", client: @client.company_name)
        else
          t(".not_contact_failure", client: @client.company_name)
        end
    end

    redirect_to admins_clients_path
  end

  def create
    @client = Client.new client_params

    if @client.save
      flash[:success] = t ".success"

      ContactMailer.contact_email().deliver
    else
      flash[:danger] = t ".failure"
    end

    redirect_to request.referrer || root_path
  end

  private

  def client_params
    params.require(:client).permit :company_name, :person_in_charge, :email, :phone_number, :prefecture, :address, :content, :department
  end

  def load_client
    @client = Client.find_by id: params[:id]

    flash[:danger] = t("record.not_found", object_company_name: Client.name) unless @client
  end
end
