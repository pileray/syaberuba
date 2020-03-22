class ChangeDataContentToDiscussion < ActiveRecord::Migration[5.2]
  def change
    change_column :discussions, :content, :text
    change_column :comments, :opinion, :text
    change_column :comments, :learning, :text
  end
end
