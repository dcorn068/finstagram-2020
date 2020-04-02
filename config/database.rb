# frozen_string_literal: true

configure do
  if Sinatra::Application.development?

    # Log queries to STDOUT in development
    ActiveRecord::Base.logger = Logger.new(STDOUT)

    set :database, {
      adapter: 'sqlite3',
      database: 'db/db.sqlite3'
    }
  else
    db = URI.parse(ENV['DATABASE_URL'] || 'postgres://ccsjteymehbchr:01a990148a112417c0a17123217d382d2517b4c1657087821f2c5cd6fb44ad7a@ec2-54-157-78-113.compute-1.amazonaws.com:5432/d8072gvf66c5h3
')
    set :database, {
      adapter: 'postgresql',
      host: db.host,
      username: db.user,
      password: db.password,
      database: db.path[1..-1],
      encoding: 'utf8'
    }
  end

  # Load all models from app/models, using autoload instead of require
  # See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
  Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
    filename = File.basename(model_file).gsub('.rb', '')
    autoload ActiveSupport::Inflector.camelize(filename), model_file
  end
end
