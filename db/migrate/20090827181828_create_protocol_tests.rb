class CreateProtocolTests < ActiveRecord::Migration
  def self.up
    create_table :protocol_tests do |t|
      t.string :data
      t.boolean :result

      t.timestamps
    end
  end

  def self.down
    drop_table :protocol_tests
  end
end
