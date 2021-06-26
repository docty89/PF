class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false #通知を送ったユーザID
      t.integer :visited_id, null: false #通知を送られたユーザID
      t.integer :relationship_id #フォローID
      t.integer :chat_id #チャットID
      t.string :action, default: '', null: false #通知の種類（フォロー、チャット）
      t.boolean :checked, default: false, null: false #通知を送られたユーザが通知を確認したかどうか
      t.timestamps
    end
      add_index :notifications, :visitor_id
      add_index :notifications, :visited_id
      add_index :notifications, :relationship_id
      add_index :notifications, :chat_id
  end
end
