Rails.application.routes.draw do
    root :to => 'home#index'
    mount Ckeditor::Engine => 'ckeditor'

    if Rails.env.production?
      mount LetsEncrypt::Engine => '/.well-known'
    end    

    devise_for :admins, :controllers => { :sessions => "admins/sessions",:registrations => "admins/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
      get '/admins', :to => 'admins::Registrations#index'
      get 'edit', :to => 'admins::Registrations#edit'
      get 'login', :to => 'admins::Sessions#new'
      get 'logout', :to=> 'admins::Sessions#destroy'
    end

    devise_for :users, :controllers => { :sessions => "users/sessions",:registrations => "users/registrations" }, :path_names =>  {:sign_up=>'new',:sign_in => 'login', :sign_out => 'logout'} do
      get 'new', :to => 'users::Registrationss#new'
      get 'edit', :to => 'users::Registrationss#edit'
      get 'login', :to => 'users::Sessions#new'
      get 'logout', :to=> 'users::Sessions#destroy'
    end

    get '/login', :to =>  'users/sessions#new'
    get '/users/complete', :to =>  'users#complete'
    get '/questions/complete', :to =>  'questions#complete'
    resources :reports
    resources :question_categories
    resources :questions
    resources :users
    resources :users_questions


    # 관리자
    namespace :admin do
      get '/' => 'admin_home#index'

      resources :question_categories
      resources :questions
      resources :answers
      resources :sub_questions
      resources :sub_answers
      resources :users_questions
      resources :users_questions_answers
      resources :users_sub_answers
      resources :operators
      resources :family_categories
      resources :families
      resources :educations
      resources :live_types
      resources :users do
        collection do
          delete 'destroy_multiple'
          post 'export_excel'
        end
      end
    end
end
