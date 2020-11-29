class Admin::UsersController < Admin::AdminController
  include Admin::SearchDate

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def initialize(*params)
    super(*params)

    @category=t(:menu_user)
    @sub_menu=t(:submenu_user)
    @controller_name=t('activerecord.models.user')
  end

  # GET /users
  # GET /users.json
  def index
    unless params[:per_page].present?
      params[:per_page]=20
    end

    condition_sql="1=1 "
    sql_params=[]

    if params[:name].present?
      condition_sql+="AND name like ? "
      sql_params << '%'+params[:name]+'%'
    end

    if params[:sample_id].present?
      condition_sql+="AND sample_id like ? "
      sql_params << '%'+params[:sample_id]+'%'
    end

    if params[:enable].present?
      condition_sql+="AND enable=? "
      sql_params << params[:enable]
    end

    if params[:group_id].present?
      condition_sql+="AND group_id=? "
      sql_params << params[:group_id]
    end

    if params[:start_date].present? and params[:date_p] != 'false'
      condition_sql+="AND created_at between ? AND ?"
      sql_params << change_date(params[:start_date],false)
      sql_params << change_date(params[:end_date])
    end

    @users_all_count=User.where(condition_sql,*sql_params).count
    @users = User.where(condition_sql,*sql_params).order('id desc').page(params[:page]).per(params[:per_page])

    @script='admin/users/index'

    if current_admin.role[0].title=='exporter'
      @category=t(:menu_report)
      @sub_menu=t(:submenu_report)
      @controller_name=t('activerecord.models.report')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    if current_admin.role[0].title=='exporter'
      @category=t(:menu_report)
      @sub_menu=t(:submenu_report)
      @controller_name=t('activerecord.models.report')
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @user.families.build
    @family_categories=FamilyCategory.where(:enable=>true)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @family_categories=FamilyCategory.where(:enable=>true)
    if @user.users_families_count.zero?
        @user.families.build
    end

    if current_admin.role[0].title=='exporter'
      @category=t(:menu_report)
      @sub_menu=t(:submenu_report)
      @controller_name=t('activerecord.models.report')
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
  #  @user.families.build
    @family_categories=FamilyCategory.where(:enable=>true)

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_user_path(@user), :notice => @controller_name +t(:message_success_insert)}
        format.json { render :json => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @family_categories=FamilyCategory.where(:enable=>true)

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to admin_user_path(@user), :notice => @controller_name +t(:message_success_update)}
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, :notice => @controller_name +t(:message_success_delete)  }
      format.json { head :no_content }
    end
  end

  def export_excel
    unless params[:user_ids].present?
      respond_to do |format|
        format.csv { redirect_to admin_users_path, :alert => t(:not_submit_user_id)}
        format.json { head :no_content }
      end
      return false
    end

    @users=User.where(:id=>params[:user_ids],:enable=>true).order(:id=>'asc').all
    @questions=Question.where(:enable=>true).order(:id=>'asc').all
    head = 'EF BB BF'.split(' ').map{|a|a.hex.chr}.join()

    send_data(render_to_string(layout: false).encode('UTF-16').force_encoding('UTF-8'), :type=>"application/vnd.ms-excel",:filename => "survey.xls", :encoding => "UTF-8")
  end

  def destroy_multiple
    unless params[:user_ids].present?
      respond_to do |format|
        format.html { redirect_to admin_users_path, :alert => t(:not_submit_user_id)}
        format.json { head :no_content }
      end
      return false
    end

    User.destroy(params[:user_ids])

    respond_to do |format|
      format.html { redirect_to admin_users_path, :notice => @controller_name +t(:message_success_delete)  }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:login_id,:name,:birthday,:password,:password_confirmation,:enable,:job,:education_id,:live_type_id,:families_attributes=>[:family_category_id,:member])
  end
end
