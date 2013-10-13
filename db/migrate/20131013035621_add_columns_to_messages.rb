class AddColumnsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :send_to_subscribers, :boolean
    add_column :messages, :send_to_twitter, :boolean
    add_column :messages, :send_to_facebook, :boolean
    add_column :messages, :send_to_vkontakte, :boolean
    add_column :messages, :temp, :text
  end
end
