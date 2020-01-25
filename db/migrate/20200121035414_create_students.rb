class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.integer :grade, null: false
      t.string :student_id_number, null: false

      t.timestamps
    end

    add_reference :students, :school, foreign_key: true, null: false
  end
end
