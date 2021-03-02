class CreateTodoApps < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_apps do |t|
      t.belongs_to :user
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
