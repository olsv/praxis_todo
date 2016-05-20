module V1
  module Resources
    class Todo < Praxis::Mapper::Resource
      model ::Todo

      property :id
      property :href, dependencies: [:id]

      def href
        V1::ApiResources.const_get(model.name).to_href(id: self.id)
      end
    end
  end
end
