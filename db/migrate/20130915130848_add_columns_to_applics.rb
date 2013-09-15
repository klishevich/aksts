class AddColumnsToApplics < ActiveRecord::Migration
  def change
  	add_column :applics, :bal_2013_spring, :decimal
  	add_column :applics, :bal_2012_fall, :decimal
  	add_column :applics, :bal_total, :decimal 
  	add_column :applics, :social_work_yes, :boolean
  	add_column :applics, :social_work_no, :boolean
  	add_column :applics, :recomendation_antok, :boolean
  	add_column :applics, :recomendation_not_antok, :boolean
  	add_column :applics, :recomendation_no, :boolean
  end
end
