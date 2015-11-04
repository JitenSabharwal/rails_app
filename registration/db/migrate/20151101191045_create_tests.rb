class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.text :question
      t.string :option1
      t.string :option2
      t.string :option3
      t.string :option4
      t.string :correct

      t.timestamps null: false
    end
  end
end
