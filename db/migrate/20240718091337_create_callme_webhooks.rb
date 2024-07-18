class CreateCallmeWebhooks < ActiveRecord::Migration[7.1]
  def change
    create_table :callme_webhooks do |t|
      t.string :name, null: false
      t.string :key, null: false
      t.integer :hook_type, null: false
      t.integer :fanout_type, null: false
      t.json :fanout_config

      t.timestamps
    end
  end
end
