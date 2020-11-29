class QuestionCategoriesController < ApplicationController
    before_action :set_question_category, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @controller_name = t('activerecord.models.question_category')
    end

    # GET /question_categories
    # GET /question_categories.json
    def index
        params[:per_page] = 10 unless params[:per_page].present?

        @question_categories = QuestionCategory.order('id desc').page(params[:page]).per(params[:per_page])


    end

    # GET /question_categories/1
    # GET /question_categories/1.json
    def show
        @users_questions = UsersQuestion.where(user_id: current_user.id, question_id: @question_category.questions.ids)

        total_var
    end

    # GET /question_categories/new
    # GET /question_categories/new.json
    def new
        @question_category = QuestionCategory.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @question_category }
        end
    end

    # GET /question_categories/1/edit
    def edit; end

    # POST /question_categories
    # POST /question_categories.json
    def create
        @question_category = QuestionCategory.new(question_category_params)

        respond_to do |format|
            if @question_category.save
                format.html { redirect_to question_category_path(@question_category), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @question_category, status: :created, location: @question_category }
            else
                format.html { render action: 'new' }
                format.json { render json: @question_category.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /question_categories/1
    # PATCH/PUT /question_categories/1.json
    def update
        respond_to do |format|
            if @question_category.update(question_category_params)
                format.html { redirect_to question_category_path(@question_category), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @question_category }
            else
                format.html { render :edit }
                format.json { render json: @question_category.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /question_categories/1
    # DELETE /question_categories/1.json
    def destroy
        @question_category.destroy
        respond_to do |format|
            format.html { redirect_to question_categories_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_question_category
        @question_category = QuestionCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_category_params
        params.require(:question_category).permit(:title, :enable)
    end
end
