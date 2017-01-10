class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :priority
      t.boolean :completed
      t.string :date
      t.string :description
      t.timestamps
    end
  end

end
