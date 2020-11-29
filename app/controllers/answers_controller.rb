class AnswersController < ApplicationController
    before_action :set_answer, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @controller_name = t('activerecord.models.answer')
    end

    # GET /answers
    # GET /notanswersices.json
    def index
        params[:per_page] = 10 unless params[:per_page].present?

        @search_type = t(:label_title)

        if params[:search_type].present?
            @search_type = t(:label_sub_title) if params[:search_type] == 'sub_title'
        end

        if params[:search_type].present? && params[:search_value].present?
            condition_sql = '1=1 '
            sql_params = []

            if params[:search_type] == 'title'
                condition_sql += 'AND title like ? '
                sql_params << '%' + params[:search_value] + '%'
            end

            @answers_all_count = Answer.where(condition_sql, *sql_params).count
            @answers = Answer.where(condition_sql, *sql_params).order('id desc').page(params[:page]).per(params[:per_page])
        else
            @answers_all_count = Answer.count
            @answers = Answer.order('id desc').page(params[:page]).per(params[:per_page])
        end
    end

    # GET /answers/1
    # GET /answers/1.json
    def show; end

    # GET /answers/new
    # GET /answers/new.json
    def new
        @answer = Answer.new
        @script = 'admin/new'

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @answer }
        end
    end

    # GET /answers/1/edit
    def edit
        @script = 'admin/new'
    end

    # POST /answers
    # POST /answers.json
    def create
        @answer = Answer.new(answer_params)

        respond_to do |format|
            if @answer.save

              @questions = Question.where(:enable=>true).order('id asc')
              last_answered_question=UsersAnswer.where(:user_id=>current_user.id).order('answer_id desc').first

              question_id=0
              @questions.each do |question|
                if question.id>last_answered_question.answer.question_id
                  question_id=question.id
                  break
                end
              end

              if question_id.zero?
                format.html { redirect_to question_complete_path, notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @answer, status: :created, location: @answer }
              else
                format.html { redirect_to question_path(question_id), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @answer, status: :created, location: @answer }
              end
            else
                format.html { render action: 'new' }
                format.json { render json: @answer.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /answers/1
    # PATCH/PUT /answers/1.json
    def update
        respond_to do |format|
            if @related_action.update(answer_params)

                format.html { redirect_to admin_answer_path(@answer), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @answer }
            else
                format.html { render :edit }
                format.json { render json: @answer.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /answers/1
    # DELETE /answers/1.json
    def destroy
        @answer.destroy
        respond_to do |format|
            format.html { redirect_to admin_answers_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between answers.
    def set_answer
        @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
        params.require(:answer).permit(:question_id, :title, :enable, :answer_ids=>[])
    end
end
