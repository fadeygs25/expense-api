Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # Cho phép mọi nguồn truy cập
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
