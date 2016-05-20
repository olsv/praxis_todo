module V1
  module ApiResources
    class Todo
      include Praxis::ResourceDefinition

      media_type V1::MediaTypes::Todo
      version '1.0'
      prefix '/todos'

      action :index do
        routing { get '' }

        params do
          attribute :view, String, default: 'default'
        end

        response :ok
      end

      action :show do
        routing { get '/:id' }

        params do
          attribute :id, Integer, required: true
        end

        response :ok
        response :not_found
      end

      action :create do
        routing { post '' }

        payload do
          attribute :text, String, required: true
        end

        response :created
      end

      action :update do
        routing { patch '/:id' }

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
        routing { delete '/:id' }

        params do
          attribute :id, Integer, required: true
        end

        response :no_content
        response :not_found
      end
    end
  end
end
