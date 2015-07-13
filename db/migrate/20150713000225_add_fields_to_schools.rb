class AddFieldsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :latitude, :float
    add_column :schools, :longitude, :float
    add_column :schools, :description, :text
  end
end
