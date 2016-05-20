module V2
  module MediaTypes
    class Todo < Praxis::MediaType
      identifier 'application/vnd.praxis.todo'
      domain_model 'V2::Resources::Todo'

      attributes do
        attribute :text, String, example: /[:word:]/,
          description: 'Text to display'
        attribute :id, Integer,
          description: 'Todo ID'
        attribute :href, String, example: proc { |r| "/api/todos/#{r.id}"  }
        attribute :kind, String, example: 'praxis#todo'
      end

      view :default do
        attribute :id
        attribute :text
        attribute :href
        attribute :kind
      end
    end
  end
end
