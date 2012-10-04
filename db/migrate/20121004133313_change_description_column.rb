class ChangeDescriptionColumn < ActiveRecord::Migration
  def up
  	change_column :pictures, :description, :text
  end

  def down
  end
end
