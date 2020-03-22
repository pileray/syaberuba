class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :opinion
      t.string :learning
      t.references :user, foreign_key: true
      t.references :discussion, foreign_key: true

      t.timestamps
    end
  end
end
