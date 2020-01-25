class AddUniqueIndexesToSubjectAndStudentAndHomeworkmarking < ActiveRecord::Migration[6.0]
  def change
    add_index :students, [:school_id, :student_id_number], unique: true
    add_index :subjects, [:school_id, :name], unique: true
    add_index :homework_markings, [:homework_id, :homework_question_id, :student_id], name: 'idx_homeworkid_homeworkquestionid_studentid'
  end
end
