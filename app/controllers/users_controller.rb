class UsersController < ApplicationController
    load_and_authorize_resource except: [:new, :create]
    before_action :set_user, only: [:edit, :update, :destroy]

    def initialize(*params)
        super(*params)

        @controller_name = t('activerecord.models.user')
    end

    # POST /users
    # POST /users.json
    def create
        respond_to do |format|
            if @user.save
                format.html { redirect_to user_path(@user), notice: @controller_name + t(:message_success_insert) }
                format.json { render json: @user, status: :created, location: @user }
            else
                format.html { render action: 'new' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    # PUT /users/1
    # PUT /users/1.json
    def update
        respond_to do |format|
            if @user.update_attributes(user_params)
                format.html { redirect_to user_path(@user), notice: @controller_name + t(:message_success_update) }
                format.json { head :no_content }
            else
                format.html { render action: 'edit' }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
        @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
        params.require(:user).permit(:login_id)
    end
end
