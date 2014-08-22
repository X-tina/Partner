class AddColumnUserIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :integer
  end
end
