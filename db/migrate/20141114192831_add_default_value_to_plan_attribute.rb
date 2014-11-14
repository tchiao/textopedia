class AddDefaultValueToPlanAttribute < ActiveRecord::Migration
  def change
    change_column :users, :plan, :string, :default => "free"
  end
end
