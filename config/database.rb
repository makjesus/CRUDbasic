# database.rb

require 'sqlite3'
require 'active_record'

# Configuração do banco de dados
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite3'
)

# Definindo um modelo para interagir com a tabela do banco de dados
class Item < ActiveRecord::Base
end

# Carregar todos os arquivos de modelo
Dir.glob('./models/*.rb').each { |file| require file }
