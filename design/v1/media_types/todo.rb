module V1
  module MediaTypes
    class Todo < Praxis::MediaType
      identifier 'application/vnd.praxis.todo'
      domain_model 'V1::Resources::Todo'

      attributes do
        attribute :text, String, example: /[:word:]/,
          description: 'Text to display'
        attribute :id, Integer,
          description: 'Todo ID'
        attribute :href, String
      end

      view :default do
        attribute :id
        attribute :text
        attribute :href
      end
    end
  end
end
