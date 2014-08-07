# Create migration for enabling the hstore extension on the pg database.
class EnableHstore < ActiveRecord::Migration
  def up
    enable_extension "hstore"
  end

  def down
    enable_extension "hstore"
  end
end
