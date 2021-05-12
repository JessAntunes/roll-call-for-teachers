class AddProviderColumnToLecturers < ActiveRecord::Migration[6.1]
  def change
    add_column :lecturers, :provider, :string
  end
end
