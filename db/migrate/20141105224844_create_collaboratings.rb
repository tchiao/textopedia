class CreateCollaboratings < ActiveRecord::Migration
  def change
    create_table :collaboratings do |t|
      t.integer :text_id
      t.integer :user_id

      t.timestamps
    end

    add_index :collaboratings, :user_id
    add_index :collaboratings, :text_id
  end

end
