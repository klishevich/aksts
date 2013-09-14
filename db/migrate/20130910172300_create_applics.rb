class CreateApplics < ActiveRecord::Migration
  def change
    create_table :applics do |t|
      t.integer :user_id
      t.boolean :student
      t.boolean :student_magistrant
      t.boolean :aspirant
      t.boolean :specialist
      t.boolean :bachelor
      t.boolean :magister
      t.boolean :participate_grant
      t.boolean :participate_ygf
      t.boolean :spec_astronomy
      t.boolean :spec_agriculture
      t.boolean :spec_aeronaft
      t.boolean :spec_biotech_midicine
      t.boolean :spec_geology
      t.boolean :spec_it
      t.boolean :spec_shipbuilding
      t.boolean :spec_cryptography
      t.boolean :spec_maths
      t.boolean :spec_material
      t.boolean :spec_carbuilding
      t.boolean :spec_medicine
      t.boolean :spec_mechanics
      t.boolean :spec_nanotech
      t.boolean :spec_tutoring
      t.boolean :spec_phsyhology
      t.boolean :spec_pedology
      t.boolean :spec_robototechnics
      t.boolean :spec_sociology
      t.boolean :spec_building_arcitecture_design
      t.boolean :spec_physics
      t.boolean :spec_chemistry
      t.boolean :spec_energetics_electrotechnics
      t.string :spec_other
      t.string :fio_rus
      t.string :fio_eng
      t.string :fio_kor
      t.string :post_address
      t.string :phone_home
      t.string :phone_work
      t.string :aksts_events_participation
      t.boolean :sex_m
      t.boolean :sex_w
      t.string :university
      t.integer :study_year
      t.string :email
      t.date :birth
      t.integer :aksts_enter_year
      t.string :q_your_values
      t.string :q_your_contribution
      t.string :q_your_problem_solving
      t.string :q_antok_interaction
      t.string :q_antok_suggestions
      
      t.timestamps
    end
    add_index :applics, [:user_id]
  end
end
