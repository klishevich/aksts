class ApplicReport < Prawn::Document

  def generate(applic)
  	@applic = applic
    # text "#{@applic.fio_rus}"
    font("#{Rails.root.to_s}/app/reports/fonts/verdana.ttf") do
      default_leading 5
      # text_box I18n.t(:your_application_details), width: 300, height: 50, size: 18
      text I18n.t(:your_application_details), size: 22
      move_down 20
      text I18n.t(:your_status), size: 18
      # table([ [if @applic.student {"X"}, I18n.t('activerecord.attributes.applic.student')],
      # [if @applic.student_magistrant {'X'} , I18n.t('activerecord.attributes.applic.student_magistrant')] ])
      str1 = @applic.student ? "X " : "_ "
      text str1+I18n.t('activerecord.attributes.applic.student')
      str2 = @applic.student_magistrant ? "X " : "_ "
      text str2+I18n.t('activerecord.attributes.applic.student_magistrant')
      move_down 10
      text I18n.t(:your_event), size: 18
      str3 = @applic.participate_grant ? "X " : "_ "
      text str3+I18n.t('activerecord.attributes.applic.participate_grant') 
      str4 = @applic.participate_ygf ? "X " : "_ "
      text str4+I18n.t('activerecord.attributes.applic.participate_ygf')     

      move_down 10
      text I18n.t(:your_personal_info), size: 18
      text I18n.t('activerecord.attributes.applic.fio_rus') + ": " + @applic.fio_rus
      text I18n.t('activerecord.attributes.applic.fio_eng') + ": " + @applic.fio_eng
      text I18n.t('activerecord.attributes.applic.post_address') + ": " + @applic.post_address
      text I18n.t('activerecord.attributes.applic.email') + ": " + @applic.email
      text I18n.t('activerecord.attributes.applic.phone_home') + ": " + @applic.phone_home
      text I18n.t('activerecord.attributes.applic.phone_work') + ": " + @applic.phone_work
      text I18n.t('activerecord.attributes.applic.aksts_events_participation') + ": " + @applic.aksts_events_participation
      text I18n.t(:your_sex), size: 16
      str6 = @applic.sex_m ? "X " : "_ "
      text str6+I18n.t('activerecord.attributes.applic.sex_m')      
      str7 = @applic.sex_w ? "X " : "_ "
      text str7 + I18n.t('activerecord.attributes.applic.sex_w')      
      text I18n.t('activerecord.attributes.applic.university') + ": " + @applic.university
      text I18n.t('activerecord.attributes.applic.study_year') + ": " + @applic.study_year.to_s
      text I18n.t('activerecord.attributes.applic.birth') + ": " + @applic.birth.to_s
      text I18n.t('activerecord.attributes.applic.aksts_enter_year') + ": " + @applic.aksts_enter_year.to_s

	  move_down 10
      text I18n.t(:your_specialization), size: 18
      str11 = @applic.spec_astronomy ? "X " : "_ "
      text str11+I18n.t('activerecord.attributes.applic.spec_astronomy')    
      str12 = @applic.spec_agriculture ? "X " : "_ "
      text str12+I18n.t('activerecord.attributes.applic.spec_agriculture')     
      str13 = @applic.spec_aeronaft ? "X " : "_ "
      text str13+I18n.t('activerecord.attributes.applic.spec_aeronaft')    
      str14 = @applic.spec_biotech_midicine ? "X " : "_ "
      text str14+I18n.t('activerecord.attributes.applic.spec_biotech_midicine') 
      str15 = @applic.spec_geology ? "X " : "_ "
      text str15+I18n.t('activerecord.attributes.applic.spec_geology')       
      str16 = @applic.spec_it ? "X " : "_ "
      text str16+I18n.t('activerecord.attributes.applic.spec_it')       
      str17 = @applic.spec_shipbuilding ? "X " : "_ "
      text str17+I18n.t('activerecord.attributes.applic.spec_shipbuilding') 
      str18 = @applic.spec_cryptography ? "X " : "_ "
      text str18+I18n.t('activerecord.attributes.applic.spec_cryptography')    
      str19 = @applic.spec_maths ? "X " : "_ "
      text str19+I18n.t('activerecord.attributes.applic.spec_maths')   
      str20 = @applic.spec_material ? "X " : "_ "
      text str20+I18n.t('activerecord.attributes.applic.spec_material')   
      str20 = @applic.spec_carbuilding ? "X " : "_ "
      text str20+I18n.t('activerecord.attributes.applic.spec_carbuilding')               
      str21 = @applic.spec_medicine ? "X " : "_ "
      text str21+I18n.t('activerecord.attributes.applic.spec_medicine')               
      str22 = @applic.spec_mechanics ? "X " : "_ "
      text str22+I18n.t('activerecord.attributes.applic.spec_mechanics')               
      str23 = @applic.spec_nanotech ? "X " : "_ "
      text str23+I18n.t('activerecord.attributes.applic.spec_nanotech')               
      str24 = @applic.spec_tutoring ? "X " : "_ "
      text str24 + I18n.t('activerecord.attributes.applic.spec_tutoring')               
      str25 = @applic.spec_phsyhology ? "X " : "_ "
      text str25 + I18n.t('activerecord.attributes.applic.spec_phsyhology')               
      str26 = @applic.spec_pedology ? "X " : "_ "
      text str26 + I18n.t('activerecord.attributes.applic.spec_pedology')               
      str27 = @applic.spec_robototechnics ? "X " : "_ "
      text str27 + I18n.t('activerecord.attributes.applic.spec_robototechnics')               
      str28 = @applic.spec_sociology ? "X " : "_ "
      text str28 + I18n.t('activerecord.attributes.applic.spec_sociology')               
      str29 = @applic.spec_building_arcitecture_design ? "X " : "_ "
      text str29 + I18n.t('activerecord.attributes.applic.spec_building_arcitecture_design')               
      str30 = @applic.spec_physics ? "X " : "_ "
      text str30 + I18n.t('activerecord.attributes.applic.spec_physics')               
      str31 = @applic.spec_chemistry ? "X " : "_ "
      text str31 + I18n.t('activerecord.attributes.applic.spec_chemistry')               
      str32 = @applic.spec_energetics_electrotechnics ? "X " : "_ "
      text str32 + I18n.t('activerecord.attributes.applic.spec_energetics_electrotechnics')               
	  text I18n.t('activerecord.attributes.applic.spec_other') + ": " + @applic.spec_other     

	  move_down 10
	  text I18n.t(:your_add_info), size: 18
	  move_down 7
	  text I18n.t(:your_bal), size: 16
	  text I18n.t('activerecord.attributes.applic.bal_2013_spring') + ": " + @applic.bal_2013_spring.to_s 
	  text I18n.t('activerecord.attributes.applic.bal_2012_fall') + ": " + @applic.bal_2012_fall.to_s  
	  text I18n.t('activerecord.attributes.applic.bal_total') + ": " + @applic.bal_total.to_s 
	  move_down 7
	  text I18n.t(:your_social), size: 16
      str40 = @applic.social_work_yes ? "X " : "_ "
      text str40 + I18n.t('activerecord.attributes.applic.social_work_yes')
      str41 = @applic.social_work_no ? "X " : "_ "
      text str41 + I18n.t('activerecord.attributes.applic.social_work_no')      
	  move_down 7
	  text I18n.t(:your_recomendations), size: 16
      str42 = @applic.recomendation_antok ? "X " : "_ "	  
      text str42 + I18n.t('activerecord.attributes.applic.recomendation_antok')      
      str43 = @applic.recomendation_not_antok ? "X " : "_ "	  
      text str43 + I18n.t('activerecord.attributes.applic.recomendation_not_antok')      
      str44 = @applic.recomendation_no ? "X " : "_ "	  
      text str44 + I18n.t('activerecord.attributes.applic.recomendation_no')

	  move_down 10
	  text I18n.t(:your_esse), size: 18
	end
	font("#{Rails.root.to_s}/app/reports/fonts/verdanab.ttf") do
      text I18n.t('activerecord.attributes.applic.q_your_values')
    end
    font("#{Rails.root.to_s}/app/reports/fonts/verdana.ttf") do
      text @applic.q_your_values 
      move_down 7   
    end
    font("#{Rails.root.to_s}/app/reports/fonts/verdanab.ttf") do
      text I18n.t('activerecord.attributes.applic.q_your_contribution')
    end
    font("#{Rails.root.to_s}/app/reports/fonts/verdana.ttf") do
      text @applic.q_your_contribution
      move_down 7
    end
	font("#{Rails.root.to_s}/app/reports/fonts/verdanab.ttf") do   
      text I18n.t('activerecord.attributes.applic.q_your_problem_solving')
    end
    font("#{Rails.root.to_s}/app/reports/fonts/verdana.ttf") do
      text @applic.q_your_problem_solving  
    end

  end

end