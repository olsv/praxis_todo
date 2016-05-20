module V2
  module ApiResources
    class Todo
      include Praxis::ResourceDefinition

      media_type V2::MediaTypes::Todo
      version '2.0'
      prefix ''

      action :status do
        routing { get '/todos/status' }
        response :ok
      end

      action :index do
        routing { get '/todos' }

        params do
          attribute :view, String, default: 'default'
        end

        response :ok
      end

      action :show do
        routing { get '/todos/:id' }

        params do
          attribute :id, Integer, required: true
        end

        response :ok
        response :not_found
      end

      action :create do
        routing { post '/todos' }

        payload do
          attribute :text, String, required: true
        end

        response :created
      end

      action :update do
        routing { patch '/todos/:id' }

        params do
          attribute :id, Integer, required: true
        end

        payload do
          attribute :text, String, required: true
        end

        response :ok
        response :not_found
      end

      action :delete do
        routing { delete '/todos/:id' }

        params do
          attribute :id, Integer, required: true
        end

        response :no_content
        response :not_found
      end
    end
  end
end
