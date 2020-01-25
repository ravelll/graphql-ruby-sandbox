class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :name

      t.timestamps
    end

    add_reference :sections, :school, foreign_key: true, null: false
    add_reference :students, :section, foreign_key: true, null: false
    add_reference :teachers, :section, foreign_key: true, null: false
  end
end
