class AddUidToColumnToLecturer < ActiveRecord::Migration[6.1]
  def change
    add_column :lecturers, :uid, :string
  end
end
