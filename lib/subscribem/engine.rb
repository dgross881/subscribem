module Subscribem
  class Engine < ::Rails::Engine
    isolate_namespace Subscribem

    config.generators do |g|
      g.test_framework :rspec, views_specs: false
    end
  end
end
