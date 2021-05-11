class CreateLecturers < ActiveRecord::Migration[6.1]
  def change
    create_table :lecturers do |t|
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
