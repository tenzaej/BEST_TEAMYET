class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :best_answer_id
      t.string :title
      t.text :content


      t.timestamps(null:false)
    end
  end
end
