class CreateHomeworkMarkings < ActiveRecord::Migration[6.0]
  def change
    create_table :homework_markings do |t|
      t.string :mark

      t.timestamps
    end

    add_reference :homework_markings, :student, foreign_key: true, null: false
    add_reference :homework_markings, :homework, foreign_key: true, null: false
    add_reference :homework_markings, :homework_question, foreign_key: true, null: false
  end
end
