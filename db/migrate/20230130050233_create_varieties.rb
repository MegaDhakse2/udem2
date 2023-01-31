class CreateVarieties < ActiveRecord::Migration[7.0]
  def change
    create_table :varieties do |t|
      t.string :name

      t.timestamps
    end
  end
end
