class CreateStudents < ActiveRecord::Migration[6.0]
  def change
    create_table :students do |t|
      t.string :code
      t.string :name
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
