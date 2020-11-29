class Admin::FamiliesController < Admin::AdminController
    before_action :set_family, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @category=t(:menu_user)
        @sub_menu=t(:submenu_family)
        @controller_name = t('activerecord.models.family')
    end

    # GET /families
    # GET /families.json
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
                @families = Family.joins(:notice_content).where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            else
                @families = Family.where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            end
        else
            @families = Family.order('id desc').page(params[:page]).per(params[:per_page])
        end
    end

    # GET /families/1
    # GET /families/1.json
    def show; end

    # GET /families/new
    # GET /families/new.json
    def new
        @family = Family.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @family }
        end
    end

    # GET /families/1/edit
    def edit; end

    # POST /families
    # POST /families.json
    def create
        @family = Family.new(family_params)

        respond_to do |format|
            if @family.save
                format.html { redirect_to admin_family_path(@family), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @family, status: :created, location: @family }
            else
                format.html { render action: 'new' }
                format.json { render json: @family.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /families/1
    # PATCH/PUT /families/1.json
    def update
        respond_to do |format|
            if @family.update(family_params)
                format.html { redirect_to admin_family_path(@family), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @family }
            else
                format.html { render :edit }
                format.json { render json: @family.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /families/1
    # DELETE /families/1.json
    def destroy
        @family.destroy
        respond_to do |format|
            format.html { redirect_to admin_families_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_family
        @family = Family.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_params
        params.require(:family).permit(:family_category_id, :member, :enable)
    end
end
