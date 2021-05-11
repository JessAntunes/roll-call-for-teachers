class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :subject
      t.belongs_to :student, null: false, foreign_key: true
      t.belongs_to :lecturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
