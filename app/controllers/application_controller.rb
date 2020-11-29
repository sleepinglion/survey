class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  def initialize(*params)
    super(*params)

    @style='application'
    @script='application'
  end

  def get_next_question_id
    if current_user.sex
      @question_category_female=QuestionCategory.where(:female_only=>true)
      not_answerd_questions=Question.where.not(:question_category_id=>@question_category_female.ids).where("questions.id NOT IN (?)", UsersQuestion.select(:question_id).where(:user_id=>current_user.id).map(&:question_id).uniq).order('questions.id asc')
    else
      not_answerd_questions=Question.where("questions.id NOT IN (?)", UsersQuestion.select(:question_id).where(:user_id=>current_user.id).map(&:question_id).uniq).order('questions.id asc')
    end

    if not_answerd_questions.count.zero?
      return false
    else
      return not_answerd_questions[0]
    end
  end

  def total_var
    if current_user.sex
      @question_category_female=QuestionCategory.where(:female_only=>true)
      @total_question=Question.where(:enable=>true).where.not(:question_category_id=>@question_category_female.ids).count
    else
      @total_question=Question.where(:enable=>true).count
    end

    @total_answered=UsersQuestion.where(:user_id=>current_user.id).count
  end

  def current_ability
    @current_ability ||= UserAbility.new(current_user)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to new_user_session_path, :notice => t(:login_first)
  end

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
  end

  def layout
    if(params[:no_layout])
      return nil
    else
      return 'application'
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:login_id, :password,
      :password_confirmation, :remember_me, :photo, :photo_cache, :remove_photo) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:login_id, :password,
      :password_confirmation, :current_password, :photo, :photo_cache, :remove_photor) }
  end
end
