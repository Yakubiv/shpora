class AddReadAtToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :read_at, :boolean
  end
end
