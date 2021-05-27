class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
	    t.references :question, index: true
      t.references :survey, index: true
      t.text :content

      t.timestamps
    end
  end
end
