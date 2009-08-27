class CreateProtocolTests < ActiveRecord::Migration
  def self.up
    create_table :protocol_tests do |t|
      t.integer :protocol_id
      t.string :data
      t.boolean :result
    end
  end

  def self.down
    drop_table :protocol_tests
  end
end
