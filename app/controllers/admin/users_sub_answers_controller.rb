class Admin::UsersSubAnswersController < Admin::AdminController
    before_action :set_users_sub_sub_answer, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @category = t(:menu_users_answer)
        @sub_menu = t(:submenu_users_answer)
        @controller_name = t('activerecord.models.users_sub_answer')
    end

    # GET /user_sub_answers
    # GET /user_sub_answers.json
    def index
        params[:per_page] = 10 unless params[:per_page].present?

        if params[:search_type].present?
            if params[:search_type] == 'content'
                likesql = 'report_contents.content like ?'
                likep = '%' + params[:search_value].strip + '%'
            elsif params[:search_type] == 'title'
                likesql = 'reports.title like ?'
                likep = '%' + params[:search_value].strip + '%'
            end
        end

        if params[:search_type] && params[:search_value]
            if params[:search_type] == 'content'
                @users_sub_answers = UsersSubAnswer.joins(:report_content).where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            else
                @users_sub_answers = UsersSubAnswer.where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            end
        else
            @users_sub_answers = UsersSubAnswer.order('id desc').page(params[:page]).per(params[:per_page])
        end
    end

    # GET /user_sub_answers/1
    # GET /user_sub_answers/1.json
    def show; end

    # GET /user_sub_answers/new
    # GET /user_sub_answers/new.json
    def new
        @users_sub_answer = UsersSubAnswer.new

        @script = 'admin/new'

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @users_sub_answer }
        end
    end

    # GET /user_sub_answers/1/edit
    def edit
        @script = 'admin/new'
    end

    # POST /user_sub_answers
    # POST /user_sub_answers.json
    def create
        @users_sub_answer = UsersSubAnswer.new(users_sub_answers_params)

        respond_to do |format|
            if @users_sub_answer.save
                format.html { redirect_to admin_users_sub_answers_params_path, notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @users_sub_answer, status: :created, location: @user_sub_answer }
            else
                format.html { render action: 'new' }
                format.json { render json: @users_sub_answer.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /user_sub_answers/1
    # PATCH/PUT /user_sub_answers/1.json
    def update
        respond_to do |format|
            if @users_sub_answer.update(users_sub_answers_params)
                format.html { redirect_to admin_users_sub_answers_params_path(@users_sub_answer), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @users_sub_answer }
            else
                format.html { render :edit }
                format.json { render json: @users_sub_answer.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /user_sub_answers/1
    # DELETE /user_sub_answers/1.json
    def destroy
        @users_sub_answer.destroy
        respond_to do |format|
            format.html { redirect_to admin_users_sub_answers_params_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_users_sub_answer
        @users_sub_answer = UsersSubAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_sub_answers_params
        params.require(:users_sub_answer).permit(:user_id, :sub_answer_id, :enable)
    end
end
