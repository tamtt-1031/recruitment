class Admins::AdminsController < Admins::BaseController
  before_action :load_admin, except: %i(index new create)

  def index
    @admins = Admin.newest.page(params[:page]).per Settings.admins.per_page
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new admin_params

    if @admin.save
      flash[:success] = t ".success"
      redirect_to admins_admins_path
    else
      flash[:danger] = t ".failure"
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @admin.update admin_params
      flash[:success] = t ".success"
      redirect_to admins_admins_path
    else
      flash[:danger] = t ".failure"
      render :edit
    end
  end

  def destroy
    if @admin.destroy
      flash[:success] = t ".success"
    else
      flash[:danger] = t ".failure"
    end

    redirect_to admins_admins_path
  end

  private

  def admin_params
    if params["admin"]["password"]
      params.require(:admin).permit(:name, :email, :password, :password_confirmation)
    else
      params.require(:admin).permit(:name, :email)
    end
  end

  def load_admin
    @admin = Admin.find_by id: params[:id]

    flash[:danger] = t("record.not_found", object_name: Admin.name) unless @admin
  end
end
