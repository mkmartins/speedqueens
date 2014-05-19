class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.references :home_teacher, index: true

      t.timestamps
    end
  end
end
