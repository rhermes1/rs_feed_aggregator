class CreateRsses < ActiveRecord::Migration
  def change
    create_table :rsses do |t|
      t.string :link
      t.integer :topic_id

      t.timestamps
    end
  end
end
