Rails.application.routes.draw do
  root "static_pages#home"
  get "static_pages/home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/interns", to: "static_pages#interns"
  get "/job-details", to: "static_pages#job_details"
  get "/bussiness_content", to: "static_pages#bussiness_content"
  get "/recruitment_benefit", to: "static_pages#recruitment_benefit"
  get "/specific_skills", to: "static_pages#specific_skills"
  get "/engineer_interpreter", to: "static_pages#engineer_interpreter"
  get "/study_abroad", to: "static_pages#study_abroad"
  get "/download_pdf", to: "static_pages#download_pdf"
  get "/ask", to: "static_pages#question"

  resources :jobs, only: [:show, :index] do
    resources :job_comments
  end
  resources :posts, only: [:show, :index] do
    resources :comments
  end

  devise_for :admins, controllers: {sessions: "admins/sessions", passwords: "admins/passwords"}

  devise_scope :admin do
    get "/admins/sign_out" => "devise/sessions#destroy"
  end

  namespace :admins do
    root to: "admins#index"

    resources :posts do
      member do
        get :publish
      end
    end
    resources :clients do
      member do
        get :contact
      end
    end
    resources :jobs
    resources :admins
    resources :slider_images do
      member do
        get :publish
      end
    end
  end
end
