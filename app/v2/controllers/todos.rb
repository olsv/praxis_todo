module V2
  class Todo < V1::Todo
    include Praxis::Controller
    implements V2::ApiResources::Todo

    def status
      ::Todo.count == 0 ? 'Completed!' : 'You still have something to do'
    end
  end
end
