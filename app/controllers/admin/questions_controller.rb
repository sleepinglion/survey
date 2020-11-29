class Admin::QuestionsController < Admin::AdminController
    before_action :set_question, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @category = t(:menu_question)
        @sub_menu = t(:submenu_question)
        @controller_name = t('activerecord.models.question')
    end

    # GET /questions
    # GET /notquestionsices.json
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

            @questions_all_count = Question.where(condition_sql, *sql_params).count
            @questions = Question.where(condition_sql, *sql_params).order('id desc').page(params[:page]).per(params[:per_page])
        else
            @questions_all_count = Question.count
            @questions = Question.order('id desc').page(params[:page]).per(params[:per_page])
        end
    end

    # GET /questions/1
    # GET /questions/1.json
    def show; end

    # GET /questions/new
    # GET /questions/new.json
    def new
        @question = Question.new
        @script = 'admin/new'

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @question }
        end
    end

    # GET /questions/1/edit
    def edit
        @script = 'admin/new'
    end

    # POST /questions
    # POST /questions.json
    def create
        @question = Question.new(question_params)

        respond_to do |format|
            if @question.save
                format.html { redirect_to admin_question_path(@question), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @question, status: :created, location: @question }
            else
                format.html { render action: 'new' }
                format.json { render json: @question.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /questions/1
    # PATCH/PUT /questions/1.json
    def update
        respond_to do |format|
            if @question.update(question_params)

                format.html { redirect_to admin_question_path(@question), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @question }
            else
                format.html { render :edit }
                format.json { render json: @question.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /questions/1
    # DELETE /questions/1.json
    def destroy
        @question.destroy
        respond_to do |format|
            format.html { redirect_to admin_questions_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between questions.
    def set_question
        @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
        params.require(:question).permit(:question_category_id, :title, :multi_answer, :enable)
    end
end
