class CreateHomeworks < ActiveRecord::Migration[6.0]
  def change
    create_table :homeworks do |t|
      t.timestamps
    end

    add_reference :homeworks, :section, foreign_key: true, null: false
    add_reference :homeworks, :subject, foreign_key: true, null: false
  end
end
