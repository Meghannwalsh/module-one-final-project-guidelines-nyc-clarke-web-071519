require 'bundler'
require 'require_all'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

require_all 'app'
# require_all 'lib'