class Admin::LiveTypesController < Admin::AdminController
    before_action :set_live_type, only: [:show, :edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @category=t(:menu_user)
        @sub_menu=t(:submenu_live_type)
        @controller_name = t('activerecord.models.live_type')
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
                @live_types = LiveType.joins(:notice_content).where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            else
                @live_types = LiveType.where(likesql, likep).order('id desc').page(params[:page]).per(params[:per_page])
            end
        else
            @live_types = LiveType.order('id desc').page(params[:page]).per(params[:per_page])
        end
    end

    # GET /families/1
    # GET /families/1.json
    def show; end

    # GET /families/new
    # GET /families/new.json
    def new
        @live_type = LiveType.new

        respond_to do |format|
            format.html # new.html.erb
            format.json { render json: @live_type }
        end
    end

    # GET /families/1/edit
    def edit; end

    # POST /families
    # POST /families.json
    def create
        @live_type = LiveType.new(live_type_params)

        respond_to do |format|
            if @live_type.save
                format.html { redirect_to admin_live_type_path(@live_type), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @live_type, status: :created, location: @live_type }
            else
                format.html { render action: 'new' }
                format.json { render json: @live_type.errors, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /families/1
    # PATCH/PUT /families/1.json
    def update
        respond_to do |format|
            if @live_type.update(live_type_params)
                format.html { redirect_to admin_live_type_path(@live_type), notice: @controller_name + t(:message_success_update) }
                format.json { render :show, status: :ok, location: @live_type }
            else
                format.html { render :edit }
                format.json { render json: @live_type.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /families/1
    # DELETE /families/1.json
    def destroy
        @live_type.destroy
        respond_to do |format|
            format.html { redirect_to admin_families_path }
            format.json { head :no_content }
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_live_type
        @live_type = LiveType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def live_type_params
        params.require(:live_type).permit(:title, :enable)
    end
end
