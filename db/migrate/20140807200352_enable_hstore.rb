# Create migration for enabling the hstore extension on the pg database.
class EnableHstore < ActiveRecord::Migration
  def up
    execute 'CREATE EXTENSION hstore'
  end

  def down
    execute 'DROP EXTENSION hstore'
  end
end
