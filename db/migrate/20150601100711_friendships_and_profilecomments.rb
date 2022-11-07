class FriendshipsAndProfilecomments < ActiveRecord::Migration
  def change
    create_table :profilecomments do |t|
      t.integer :user_id
      t.integer :commenter_id
      t.text :comment
      t.timestamps
    end

  create_table :friendships do |t|
    t.integer  :user_id
    t.integer  :friend_id
    t.timestamps
  end

  end
end
