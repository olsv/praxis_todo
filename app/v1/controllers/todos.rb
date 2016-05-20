module V1
  class Todo
    include Praxis::Controller
    implements V1::ApiResources::Todo
    include Praxis::Extensions::Rendering

    before actions: [:show, :update, :delete] do |controller|
      id = controller.request.params[:id]
      Thread.current[:record] = ::Todo[id]

      unless Thread.current[:record]
        Praxis::Responses::NotFound.new(body: "Record with ID #{id} does not exist")
      end
    end

    def index(view:, **other_params)
      response.headers['Content-Type'] = media_type.identifier + '+json;type=collection'
      response.body = ::Todo.all.map { |r| media_type.dump(r, view: view.to_sym) }
      response
    end

    def show(id:, **other_params)
      display Resources::Todo.new(Thread.current[:record])
    end

    def create(**params)
      todo = ::Todo.create(text: request.payload[:text])
      location = ApiResources::Todo.to_href(id: todo.id)
      Praxis::Responses::Created.new(location: location)
    end

    def update(id:, **other_params)
      Thread.current[:record].update(text: request.payload[:text])
      display Thread.current[:record]
    end

    def delete(id:, **other_params)
      Thread.current[:record].delete
      Praxis::Responses::NoContent.new
    end
  end
end
