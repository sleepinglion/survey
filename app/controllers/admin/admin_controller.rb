class Admin::AdminController < ApplicationController
    load_and_authorize_resource except: [:create]

    def initialize(*params)
        super(*params)
        @style = 'admin/application'
        @script = 'admin/application'        
    end

    def current_ability
        @current_ability ||= AdminAbility.new(current_admin)
    end

    rescue_from CanCan::AccessDenied do |_exception|
        if current_admin
            render file: "#{Rails.root}/public/403.html", status: 403, layout: false
        else
            redirect_to new_admin_session_path
        end
    end

    def layout
        if params[:no_layout]
            false
        else
            'admin/application'
        end
    end
end
