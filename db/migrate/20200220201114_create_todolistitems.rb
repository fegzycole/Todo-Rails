class CreateTodolistitems < ActiveRecord::Migration[6.0]
  def change
    create_table :todolistitems do |t|
      t.string :name
      t.boolean :status, default: false
      t.integer :todolist_id

      t.timestamps
    end
  end
end
