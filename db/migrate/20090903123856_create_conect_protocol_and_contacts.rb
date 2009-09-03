class CreateConectProtocolAndContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :protocol_id, :integer 
  end

  def self.down
    remove_column :contacts, :protocol_id, :integer 
  end
end
