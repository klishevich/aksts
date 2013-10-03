class ChangeStringType4Applics < ActiveRecord::Migration
  def up
  	change_column :applics, :q_your_values, :text
  	change_column :applics, :q_your_contribution, :text
  	change_column :applics, :q_your_problem_solving, :text
  	change_column :applics, :q_antok_interaction, :text
  	change_column :applics, :q_antok_suggestions, :text
  end

  def down
  	change_column :applics, :q_your_values, :string
  	change_column :applics, :q_your_contribution, :string
  	change_column :applics, :q_your_problem_solving, :string
  	change_column :applics, :q_antok_interaction, :string
  	change_column :applics, :q_antok_suggestions, :string
  end
end
