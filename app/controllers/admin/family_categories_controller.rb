class Admin::FamilyCategoriesController < Admin::AdminController
    before_action :set_family_category, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @category=t(:menu_user)
        @sub_menu=t(:submenu_family_category)
        @controller_name = t('activerecord.models.family_category')
    end

    # GET /question_categories
    # GET /question_categories.json
    def index
        params[:per_page] = 10 unless params[:per_page].present?

        if params[:search_type].present?
            if params[:search_type] == 'content'
                likesql = 'notice_contents.content like ?'
                likep = '%' + params[:search_value].strip + '%'
            elsif params[:search_type] == 'title'
                likesql = 'notices.title like ?'
                likep = '%' + params[:search_value].strip + '%'
            end
        end

        if params[:search_type] && params[:search_value]
            if params[:search_type] == 'content'
                @family_categories = FamilyCategory.joins(:notice_content).where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            else
                @family_categories = FamilyCategory.where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            end
        else
            @family_categories = FamilyCategory.order('id desc').page(params[:page]).per(params[:per_page])
        end
    end

    # GET /question_categories/1
    # GET /question_categories/1.json
    def show; end

    # GET /question_categories/new
    # GET /question_categories/new.json
    def new
        @family_category = FamilyCategory.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @family_category }
        end
    end

    # GET /question_categories/1/edit
    def edit; end

    # POST /question_categories
    # POST /question_categories.json
    def create
        @family_category = FamilyCategory.new(family_category_params)

        respond_to do |format|
            if @family_category.save
                format.html { redirect_to admin_family_category_path(@family_category), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @family_category, status: :created, location: @family_category }
            else
                format.html { render action: 'new' }
                format.json { render json: @family_category.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /question_categories/1
    # PATCH/PUT /question_categories/1.json
    def update
        respond_to do |format|
            if @family_category.update(family_category_params)
                format.html { redirect_to admin_family_category_path(@family_category), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @family_category }
            else
                format.html { render :edit }
                format.json { render json: @family_category.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /question_categories/1
    # DELETE /question_categories/1.json
    def destroy
        @family_category.destroy
        respond_to do |format|
            format.html { redirect_to admin_question_categories_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_family_category
        @family_category = FamilyCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_category_params
        params.require(:family_category).permit(:title, :enable)
    end
end
