class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.string :tipo
      t.references :kit, foreign_key: true

      t.timestamps
    end
    add_index :feeds, [:kit_id, :created_at]
  end
end
