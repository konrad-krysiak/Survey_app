class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.string :title
      t.integer :question_count
      t.string :email

      t.timestamps
    end
  end
end
