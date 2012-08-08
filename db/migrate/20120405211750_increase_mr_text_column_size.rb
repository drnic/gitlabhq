class IncreaseMrTextColumnSize < ActiveRecord::Migration
  def up
    if ActiveRecord::Base.connection.adapter_name.downcase =~ /mysql/
      # MYSQL LARGETEXT for merge request
      change_column :merge_requests, :st_diffs, :text, :limit => 4294967295
      change_column :merge_requests, :st_commits, :text, :limit => 4294967295
    end
  end

  def down
  end
end
