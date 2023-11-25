require 'mysql2'

module DBHelper
  def db_conn
    Thread.current[:db_conn] ||= connect_db
  end

  def connect_db
    Mysql2::Client.new(
      host: ENV.fetch('ISUCON13_MYSQL_DIALCONFIG_ADDRESS', '127.0.0.1'),
      port: ENV.fetch('ISUCON13_MYSQL_DIALCONFIG_PORT', '3306').to_i,
      username: ENV.fetch('ISUCON13_MYSQL_DIALCONFIG_USER', 'isucon'),
      password: ENV.fetch('ISUCON13_MYSQL_DIALCONFIG_PASSWORD', 'isucon'),
      database: ENV.fetch('ISUCON13_MYSQL_DIALCONFIG_DATABASE', 'isupipe'),
      symbolize_keys: true,
      cast_booleans: true,
      reconnect: true,
    )
  end

  def db_transaction(&block)
    db_conn.query('BEGIN')
    ok = false
    begin
      retval = yield(db_conn)
      db_conn.query('COMMIT')
      ok = true
      retval
    ensure
      unless ok
        db_conn.query('ROLLBACK')
      end
    end
  end
end
