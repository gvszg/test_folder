class Admin::UsersController < AdminController
  layout "admin"

  # 針對import_usere關掉表單token驗證
  skip_before_action :verify_authenticity_token, only: [:import_user]

  def index
    @users = User.recent
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "成功新增用戶"
      redirect_to admin_users_path 
    else
      flash.now[:notice] = "請確認輸入資料是否正確"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  # API for sending POST request
  def import_user
    begin
      user = User.new
      user.user_name = params[:user_name]
      user.real_name = params[:real_name]
      user.gender = params[:gender]
      user.address = params[:address]
      user.uid = params[:uid]
      user.phone = params[:phone]
      user.save!
      render json: "success"
    rescue Exception => e
      render json: "error"
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :real_name, :gender, :address, :phone, :uid, {photos: []})
  end
end