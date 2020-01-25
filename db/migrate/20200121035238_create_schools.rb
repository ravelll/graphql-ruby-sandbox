class CreateSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :grade_type
      t.string :management_type
      t.string :prefecture

      t.timestamps
    end
  end
end
