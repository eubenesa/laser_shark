class AddTagsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :tags, :hstore, array: true
  end
end
