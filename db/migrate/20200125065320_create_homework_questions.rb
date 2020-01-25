class CreateHomeworkQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :homework_questions do |t|
      t.string :content, null: false
      t.string :answer, null: false

      t.timestamps
    end

    add_reference :homework_questions, :homework, foreign_key: true, null: false
    add_reference :homework_questions, :teacher, foreign_key: true, null: false
  end
end
