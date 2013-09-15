class AddSentToApplics < ActiveRecord::Migration
  def change
    add_column :applics, :sent, :boolean, default: false
  end
end
