class CreateRelationsips < ActiveRecord::Migration
  def change
    create_table :relationsips do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
  end
end
