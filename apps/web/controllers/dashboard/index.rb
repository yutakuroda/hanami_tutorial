module Web
  module Controllers
    module Dashboard
      class Index
        include Web::Action

        def call(params)
          self.body = 'ok'
        end
      end
    end
  end
end
