class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.references :sender, index: true 
      t.references :recipient1, index: true 
      t.references :recipient2, index: true 
      t.timestamps
    end
  end
end
