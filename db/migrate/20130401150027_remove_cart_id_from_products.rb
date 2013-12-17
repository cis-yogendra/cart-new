class RemoveCartIdFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :cart_id
  end

  def down
    add_column :products, :cart_id, :integer
  end
end
