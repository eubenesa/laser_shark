# Migration for adding tags to activities
class AddTagsToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :tags, :hstore
  end
end
