module V2
  module Resources
    class Todo < Praxis::Mapper::Resource
      model ::Todo

      property :id
      property :href, dependencies: [:id]
      property :kind

      def href
        V2::ApiResources.const_get(model.name).to_href(id: self.id)
      end

      def kind
        'praxis#todo'
      end
    end
  end
end
