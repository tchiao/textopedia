class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.boolean :public, default: true
      t.text :description

      t.timestamps
    end
  end
end
