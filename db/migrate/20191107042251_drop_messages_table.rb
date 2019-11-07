class DropMessagesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :messages
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
