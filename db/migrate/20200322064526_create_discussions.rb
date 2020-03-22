class CreateDiscussions < ActiveRecord::Migration[5.2]
  def change
    create_table :discussions do |t|
      t.string :title
      t.string :content
      t.references :user, foreign_key: true
      t.string :assent
      t.string :assent_comment

      t.timestamps
    end
  end
end
