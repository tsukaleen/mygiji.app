class CreateGijis < ActiveRecord::Migration[5.2]
  def change
    create_table :gijis do |t|
    t.string      :name
    t.text        :text
    t.text        :image
      t.timestamps
    end
  end
end
