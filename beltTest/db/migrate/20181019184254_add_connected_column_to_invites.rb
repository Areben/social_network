class AddConnectedColumnToInvites < ActiveRecord::Migration
  def change
    add_column :invites, :connected, :Boolean
  end
end
