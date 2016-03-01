class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :url
      t.string :vid_lat
      t.string :vid_lng
      t.string :vid_date
      t.string :vid_time
      t.string :email
      t.string :phone
      t.text :notes
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
