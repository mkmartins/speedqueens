class CreateHomeTeachers < ActiveRecord::Migration
  def change
    create_table :home_teachers do |t|
      t.string :name

      t.timestamps
    end
  end
end
