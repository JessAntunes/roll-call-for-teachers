class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :subject
      t.string :day
      t.belongs_to :lecturer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
