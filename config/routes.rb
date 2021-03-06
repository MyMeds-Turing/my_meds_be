# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql#execute' if Rails.env.development?
    mount Sidekiq::Web => '/sidekiq'
  end
  post '/graphql', to: 'graphql#execute'
end
