class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :url_id
      t.integer :tagtopic_id
      t.timestamps
    end

    add_index :taggings, :url_id
    add_index :taggings, :tagtopic_id
  end
end
