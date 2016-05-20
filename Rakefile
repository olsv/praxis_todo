require 'praxis'
require 'praxis/tasks'

task :environment do
  Praxis::Application.instance.setup
end

Dir["lib/tasks/**/*.rake"].each { |ext| load ext }


