class Users::RegistrationsController < Devise::RegistrationsController

  def initialize(*params)
    super(*params)

    @category=t(:menu_user)
    @sub_menu=t(:submenu_admin)
    @controller_name=t(:controller_admin)
  end

  # GET /admins
  # GET /admins.json
  def index
    @users = User.where('parent_id is null').order('id desc').page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
      format.xls
    end
  end

  def user_layout
    if user_session
      "application"
    else
      "login"
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_complete_path, :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:login_id,:password,:password_confirmation,:photo,:photo_cache,:remove_photo)
  end
end
