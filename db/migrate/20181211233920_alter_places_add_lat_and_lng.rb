class AlterPlacesAddLatAndLng < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :phoneNumber, :integer
    add_column :places, :hoursOperation, :float
    add_column :places, :rating, :float
    add_column :places, :websites, :string
    add_column :places, :latitude, :float
    add_column :places, :longitude, :float
  end
end
