class Admin::EducationsController < Admin::AdminController
    before_action :set_education, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @category=t(:menu_user)
        @sub_menu=t(:submenu_user)
        @controller_name = t('activerecord.models.education')
    end

    # GET /educations
    # GET /educations.json
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
                @educations = Education.joins(:notice_content).where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            else
                @educations = Education.where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            end
        else
            @educations = Education.order('id desc').page(params[:page]).per(params[:per_page])
        end
    end

    # GET /educations/1
    # GET /educations/1.json
    def show; end

    # GET /educations/new
    # GET /educations/new.json
    def new
        @education = Education.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @education }
        end
    end

    # GET /educations/1/edit
    def edit; end

    # POST /educations
    # POST /educations.json
    def create
        @education = Education.new(education_params)

        respond_to do |format|
            if @education.save
                format.html { redirect_to admin_education_path(@education), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @education, status: :created, location: @education }
            else
                format.html { render action: 'new' }
                format.json { render json: @education.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /educations/1
    # PATCH/PUT /educations/1.json
    def update
        respond_to do |format|
            if @education.update(education_params)
                format.html { redirect_to admin_education_path(@education), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @education }
            else
                format.html { render :edit }
                format.json { render json: @education.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /educations/1
    # DELETE /educations/1.json
    def destroy
        @education.destroy
        respond_to do |format|
            format.html { redirect_to admin_educations_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_education
        @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
        params.require(:education).permit(:title, :enable)
    end
end
