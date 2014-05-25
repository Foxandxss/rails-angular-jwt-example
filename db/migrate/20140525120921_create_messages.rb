class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.references :user, index: true

      t.timestamps
    end
  end
end
