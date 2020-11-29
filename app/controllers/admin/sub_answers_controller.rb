class Admin::SubAnswersController < Admin::AdminController
    before_action :set_sub_answer, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @category = t(:menu_question)
        @sub_menu = t(:submenu_sub_answer)
        @controller_name = t('activerecord.models.sub_answer')
    end

    # GET /sub_answers
    # GET /notsub_answersices.json
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

            @sub_answers_all_count = SubAnswer.where(condition_sql, *sql_params).count
            @sub_answers = SubAnswer.where(condition_sql, *sql_params).order('id desc').page(params[:page]).per(params[:per_page])
        else
            @sub_answers_all_count = SubAnswer.count
            @sub_answers = SubAnswer.order('id desc').page(params[:page]).per(params[:per_page])
        end
    end

    # GET /sub_answers/1
    # GET /sub_answers/1.json
    def show; end

    # GET /sub_answers/new
    # GET /sub_answers/new.json
    def new
        @sub_answer = SubAnswer.new
        @script = 'admin/new'

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @sub_sub_answer }
        end
    end

    # GET /sub_answers/1/edit
    def edit
        @script = 'admin/new'
    end

    # POST /sub_answers
    # POST /sub_answers.json
    def create
        @sub_answer = SubAnswer.new(sub_answer_params)

        respond_to do |format|
            if @sub_answer.save

                format.html { redirect_to admin_sub_answer_path(@sub_answer), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @sub_answer, status: :created, location: @related_action }
            else
                format.html { render action: 'new' }
                format.json { render json: @sub_answer.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /sub_answers/1
    # PATCH/PUT /sub_answers/1.json
    def update
        respond_to do |format|
            if @sub_answer.update(sub_answer_params)

                format.html { redirect_to admin_sub_answer_path(@sub_answer), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @sub_answer }
            else
                format.html { render :edit }
                format.json { render json: @sub_answer.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /sub_answers/1
    # DELETE /sub_answers/1.json
    def destroy
        @sub_answer.destroy
        respond_to do |format|
            format.html { redirect_to admin_sub_answers_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between sub_answers.
    def set_sub_answer
        @sub_answer = SubAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_answer_params
        params.require(:sub_answer).permit(:answer_id, :title, :enable)
    end
end
