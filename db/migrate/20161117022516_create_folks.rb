class CreateFolks < ActiveRecord::Migration[5.0]
  def change
    create_table :folks do |t|
      t.string :phone_number
      t.string :name
      t.text   :message

      t.timestamps
    end
  end
end
