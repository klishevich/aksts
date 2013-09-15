class Applic < ActiveRecord::Base
  attr_accessible :student, :student_magistrant, :aspirant, :specialist, :bachelor, :magister,
      :participate_grant, :participate_ygf, :spec_astronomy, :spec_agriculture, :spec_aeronaft,
      :spec_biotech_midicine, :spec_geology, :spec_it, :spec_shipbuilding, :spec_cryptography,
      :spec_maths, :spec_material, :spec_carbuilding, :spec_medicine, :spec_mechanics,
      :spec_nanotech, :spec_tutoring, :spec_phsyhology, :spec_pedology, :spec_robototechnics,
      :spec_sociology, :spec_building_arcitecture_design, :spec_physics, :spec_chemistry,
      :spec_energetics_electrotechnics, :spec_other, :fio_rus, :fio_eng, :fio_kor, :post_address,
      :phone_home, :phone_work, :aksts_events_participation, :sex_m, :sex_w, :university, :study_year,
      :email, :birth, :aksts_enter_year, :q_your_values, :q_your_contribution, :q_your_problem_solving,
      :q_antok_interaction, :q_antok_suggestions, :bal_2013_spring, :bal_2012_fall, :bal_total, :social_work_yes, 
      :social_work_no, :recomendation_antok, :recomendation_not_antok, :recomendation_no

  belongs_to :user

  before_save { |applic| applic.email=email.downcase}

  validates :user_id, presence: true
  validates :fio_rus, presence: true, length: {minimum: 5}
  validates :fio_eng, presence: true, length: {minimum: 5}
  validates :post_address, presence: true, length: {minimum: 15}
  validates :phone_home, presence: true, length: {minimum: 10}
  validates :university, presence: true, length: {minimum: 10}
  validates :study_year, presence: true, numericality: {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 6}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :birth, presence: true
  validates :q_your_values, presence: true
  validates :q_your_contribution, presence: true
  validates :q_your_problem_solving, presence: true
  validates :bal_2013_spring, presence: true, numericality: {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 5}
  validates :bal_2012_fall, presence: true, numericality: {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 5}
  validates :bal_total, presence: true, numericality: {:greater_than_or_equal_to => 0, :less_than_or_equal_to => 5}  
end
