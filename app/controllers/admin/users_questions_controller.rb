class Admin::UsersQuestionsController < Admin::AdminController
    before_action :set_users_question, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @category = t(:menu_users_question)
        @sub_menu = t(:submenu_users_question)
        @controller_name = t('activerecord.models.users_question')
    end

    # GET /user_answers
    # GET /user_answers.json
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
                @users_questions = UsersQuestion.joins(:report_content).where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            else
                @users_questions = UsersQuestion.where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            end
        else
            @users_questions = UsersQuestion.order('id desc').page(params[:page]).per(params[:per_page])
        end
    end

    # GET /user_answers/1
    # GET /user_answers/1.json
    def show; end

    # GET /user_answers/new
    # GET /user_answers/new.json
    def new
        @users_answer = UsersQuestion.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @users_question }
        end
    end

    # GET /user_answers/1/edit
    def edit
        @script = 'admin/new'
    end

    # POST /user_answers
    # POST /user_answers.json
    def create
        @users_question = UsersQuestion.new(users_questions_params)

        respond_to do |format|
            if @users_question.save
                format.html { redirect_to admin_users_question_path(@users_question), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @users_question, status: :created, location: @user_answer }
            else
                format.html { render action: 'new' }
                format.json { render json: @users_question.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /user_answers/1
    # PATCH/PUT /user_answers/1.json
    def update
        respond_to do |format|
            if @users_question.update(users_questions_params)
                format.html { redirect_to admin_users_question_path(@users_question), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @users_question }
            else
                format.html { render :edit }
                format.json { render json: @users_question.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /user_answers/1
    # DELETE /user_answers/1.json
    def destroy
        @users_question.destroy
        respond_to do |format|
            format.html { redirect_to admin_users_questions_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_users_question
        @users_question = UsersQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_questions_params
        params.require(:users_question).permit(:user_id, :question_id, :enable)
    end
end
