# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :attendances
  resources :employees

  resources :stores
  get 'store/:id/reports', to: 'stores#reports', as: 'store_reports'
  get 'store/:id/reports/attendance_by_day', to: 'stores#reports_att_by_day', as: 'store_reports_att_by_day'
  post 'store/:id/reports/attendance_by_day/date', to: 'stores#reports_att_by_day_date',
                                                   as: 'store_reports_att_by_day_date'
  get 'store/:id/reports/absence_by_month', to: 'stores#reports_abs_by_month', as: 'store_reports_abs_by_month'
  post 'store/:id/reports/absence_by_month/date', to: 'stores#reports_abs_by_month_date',
                                                  as: 'store_reports_abs_by_month_date'
  get 'store/:id/reports/average_time_by_month', to: 'stores#reports_avg_time_by_month',
                                                 as: 'store_reports_avg_time_by_month'
  post 'store/:id/reports/average_time_by_month/date', to: 'stores#reports_avg_time_by_month_date',
                                                       as: 'store_reports_avg_time_by_month_date'

  # Session routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
