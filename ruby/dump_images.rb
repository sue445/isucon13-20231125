require_relative 'lib/db_helper'

include DBHelper

DUMP_DIR = "#{__dir__}/../img/icons_dump/"

db = db_conn

sql = <<~SQL
SELECT icons.image, users.name
FROM icons
INNER JOIN users ON icons.user_id = users.id
SQL

db.query(sql).each do |row|
  File.open("#{DUMP_DIR}#{row[:name]}.jpg", 'wb') do |f|
    f.write(row[:image])
  end
end
