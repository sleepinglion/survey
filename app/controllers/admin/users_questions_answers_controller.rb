class Admin::UsersQuestionsAnswersController < Admin::AdminController
    before_action :set_users_question_answer, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @category = t(:menu_users_question)
        @sub_menu = t(:submenu_users_question)
        @controller_name = t('activerecord.models.users_questions_answer')
    end

    # GET /users_questions_answers
    # GET /users_questions_answers.json
    def index
        params[:per_page] = 10 unless params[:per_page].present?
        @users_questions_answers = UsersQuestionsAnswer.order('id desc').page(params[:page]).per(params[:per_page])
    end

    # GET /users_questions_answers/1
    # GET /users_questions_answers/1.json
    def show; end

    # GET /users_questions_answers/new
    # GET /users_questions_answers/new.json
    def new
        @users_questions_answer = UsersQuestionsAnswer.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @users_questions_answer }
        end
    end

    # GET /users_questions_answers/1/edit
    def edit
        @script = 'admin/new'
    end

    # POST /users_questions_answers
    # POST /users_questions_answers.json
    def create
        @users_questions_answer = UsersQuestionsAnswer.new(users_questions_answer_params)

        respond_to do |format|
            if @users_questions_answer.save
                format.html { redirect_to admin_users_question_path(@users_questions_answer), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @users_questions_answer, status: :created, location: @user_answer }
            else
                format.html { render action: 'new' }
                format.json { render json: @users_questions_answer.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /users_questions_answers/1
    # PATCH/PUT /users_questions_answers/1.json
    def update
        respond_to do |format|
            if @users_questions_answer.update(users_questions_answer_params)
                format.html { redirect_to admin_users_question_path(@users_questions_answer), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @users_questions_answer }
            else
                format.html { render :edit }
                format.json { render json: @users_questions_answer.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /users_questions_answers/1
    # DELETE /users_questions_answers/1.json
    def destroy
        @users_questions_answer.destroy
        respond_to do |format|
            format.html { redirect_to admin_users_questions_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_users_question_answer
        @users_questions_answer = UsersQuestionsAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_questions_answer_params
        params.require(:users_questions_answer).permit(:users_question_id, :answer_id, :enable)
    end
end
