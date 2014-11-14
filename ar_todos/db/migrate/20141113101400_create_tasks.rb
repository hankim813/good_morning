# Creates the task table/model

class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :finished
      t.belongs_to :list
      # t.string :tag

      t.timestamps
    end
  end
end
