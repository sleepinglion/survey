class UsersQuestionsController < ApplicationController
    before_action :set_users_questions, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @controller_name = t('activerecord.models.users_answer')
    end

    def new
        @users_question = UsersQuestion.new
        b = @users_question.users_questions_answers.build
        c=b.users_questions_answers_sub_questions.build
        b.users_questions_answers_custom_answers.build
        d=c.users_questions_answers_sub_questions_sub_answers.build
        d.users_questions_answers_sub_questions_sub_answers_custom_answers.build


        @question = Question.find(params[:question_id])

        total_var
    end

    # GET /user_answers/1/edit
    def edit
        @question = Question.find(@users_question.question_id)
    end

    # POST /user_answers
    # POST /user_answers.json
    def create
        total_var

        # unless params[:users_question][:users_questions_answers_attributes].present?
        #    respond_to do |format|
        #        format.html { redirect_back fallback_location: root_path, alert: t(:not_submit_user_id) }
        #        format.json { head :no_content }
        #    end
        #    return false
        # end

        @users_question = UsersQuestion.new(users_questions_params)
        respond_to do |format|
            if @users_question.save

                if get_next_question_id
                    format.html { redirect_to question_path(get_next_question_id), notice: @controller_name + t(:message_success_insert) }
                    format.json { render json: @users_question, status: :created, location: @users_question }
                else
                    format.html { redirect_to questions_complete_path, notice: @controller_name + t(:message_success_insert) }
                    format.json { render json: @users_question, status: :created, location: @users_question }
                end
            else
                format.html { redirect_back fallback_location: root_path, alert: t(:not_submit_answer_id) }
                format.json { render json: @users_question.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /user_answers/1
    # PATCH/PUT /user_answers/1.json
    def update
        respond_to do |format|
            if @users_question.update(users_questions_params)
                format.html { redirect_to question_category_path(@users_question.question.question_category), notice: @controller_name + t(:message_success_update) }
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
            format.html { redirect_to users_questions_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_users_questions
        @users_question = UsersQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_questions_params
        params.require(:users_question).permit(:id, :question_id, answer_ids: [], users_questions_answers_attributes: [:id, :users_questions_id, :answer_id, users_questions_answers_custom_answers_attributes: [:id, :users_questions_answer_id, :title, :enable], users_questions_answers_sub_questions_attributes: [:id, :users_questions_answer_id, :sub_question_id, users_questions_answers_sub_questions_sub_answers_attributes: [:id, :users_questions_answers_sub_question_id, :sub_answer_id, users_questions_answers_sub_questions_sub_answers_custom_answers_attributes: [:id, :users_questions_sub_questions_sub_answer_id, :title, :enable]]]]).merge(user_id: current_user.id)
    end
end
