class Admin::SubQuestionsController < Admin::AdminController
    before_action :set_sub_question, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @category = t(:menu_question)
        @sub_menu = t(:submenu_sub_question)
        @controller_name = t('activerecord.models.sub_question')
    end

    # GET /sub_questions
    # GET /notsub_questionsices.json
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

            @sub_questions_all_count = SubQuestion.where(condition_sql, *sql_params).count
            @sub_questions = SubQuestion.where(condition_sql, *sql_params).order('id desc').page(params[:page]).per(params[:per_page])
        else
            @sub_questions_all_count = SubQuestion.count
            @sub_questions = SubQuestion.order('id desc').page(params[:page]).per(params[:per_page])
        end
    end

    # GET /sub_questions/1
    # GET /sub_questions/1.json
    def show; end

    # GET /sub_questions/new
    # GET /sub_questions/new.json
    def new
        @sub_question = SubQuestion.new
        @script = 'admin/new'

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @sub_question }
        end
    end

    # GET /sub_questions/1/edit
    def edit
        @script = 'admin/new'
    end

    # POST /sub_questions
    # POST /sub_questions.json
    def create
        @sub_question = SubQuestion.new(sub_question_params)

        respond_to do |format|
            if @sub_question.save
                format.html { redirect_to admin_sub_question_path(@sub_question), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @sub_question, status: :created, location: @sub_question }
            else
                format.html { render action: 'new' }
                format.json { render json: @sub_question.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /sub_questions/1
    # PATCH/PUT /sub_questions/1.json
    def update
        respond_to do |format|
            if @sub_question.update(sub_question_params)

                format.html { redirect_to admin_sub_question_path(@sub_question), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @sub_question }
            else
                format.html { render :edit }
                format.json { render json: @sub_question.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /sub_questions/1
    # DELETE /sub_questions/1.json
    def destroy
        @sub_question.destroy
        respond_to do |format|
            format.html { redirect_to admin_sub_questions_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between sub_questions.
    def set_sub_question
        @sub_question = SubQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_question_params
        params.require(:sub_question).permit(:answer_id, :title, :enable)
    end
end
