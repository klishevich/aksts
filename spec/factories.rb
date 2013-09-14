# FactoryGirl.define do
#   factory :user do
#     name     "Mikhail Klishevich"
#     email    "mih@example.com"
#     password "foobar"
#     password_confirmation "foobar"
#   end
# end

FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :applic do
    student 1
    student_magistrant 0
    aspirant 0
    specialist 0
    bachelor 0
    magister 0
    participate_grant 1
    participate_ygf 1
    spec_astronomy 0
    spec_agriculture 0
    spec_aeronaft 0
    spec_biotech_midicine 0
    spec_geology 0
    spec_it 1
    spec_shipbuilding 0
    spec_cryptography 0
    spec_maths 1
    spec_material 0
    spec_carbuilding 0
    spec_medicine 0
    spec_mechanics 0
    spec_nanotech 0
    spec_tutoring 0
    spec_phsyhology 0
    spec_pedology 0
    spec_robototechnics 0
    spec_sociology 0
    spec_building_arcitecture_design 0
    spec_physics 0
    spec_chemistry 0
    spec_energetics_electrotechnics 0
    spec_other "No"
    fio_rus "Klish Mih"
    fio_eng "klishevich Mikhail"
    fio_kor ""
    post_address "Moscow1111111111111"
    phone_home "+79165926645"
    phone_work ""
    aksts_events_participation "YGF-2011"
    sex_m 1
    sex_w 0
    university "Novosibirsk State University"
    study_year 3
    email "mans1@ngs.ru"
    birth "29.06.1981"
    aksts_enter_year 2010
    q_your_values "Healthy habits"
    q_your_contribution "Profcom lider"
    q_your_problem_solving "1st place Krasnoyarsk territory mathimatical contest"
    q_antok_interaction "twitter"
    q_antok_suggestions "more young people"
	user
  end
end