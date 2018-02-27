class CreateFeedbackAnswers < ActiveRecord::Migration
  def change
    create_table :feedback_answers do |t|
      t.references :admin_user, index: true
      t.references :feedbacks, index: true
      t.text :answer

      t.timestamps null: false
    end
  end
end
