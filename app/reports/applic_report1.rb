class ApplicReport1 < Prawn::Document

  def generate(applic)
  	@applic = applic
    font("#{Rails.root.to_s}/app/reports/fonts/verdana.ttf") do
      default_leading 5
      text I18n.t(:your_application_details), size: 22
      move_down 20
      text I18n.t(:your_status), size: 18
      str1 = @applic.student ? "- #{I18n.t('activerecord.attributes.applic.student')+"\n"}": ""
      str1+= @applic.student_magistrant ? "- #{I18n.t('activerecord.attributes.applic.student_magistrant')+"\n"}": ""
      text str1
      move_down 10
      text I18n.t(:your_event), size: 18
      str3 = @applic.participate_grant ? "- #{I18n.t('activerecord.attributes.applic.participate_grant')+"\n"}" : ""
      str3+= @applic.participate_ygf ? "- #{I18n.t('activerecord.attributes.applic.participate_ygf')+"\n"}" : ""
      text str3

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
      str6 = @applic.sex_m ? "- #{I18n.t('activerecord.attributes.applic.sex_m')+"\n"}" : ""
      str6 += @applic.sex_w ? "- #{I18n.t('activerecord.attributes.applic.sex_w')+"\n"}" : ""
      text str6     
      text I18n.t('activerecord.attributes.applic.university') + ": " + @applic.university
      text I18n.t('activerecord.attributes.applic.study_year') + ": " + @applic.study_year.to_s
      text I18n.t('activerecord.attributes.applic.birth') + ": " + @applic.birth.to_s
      text I18n.t('activerecord.attributes.applic.aksts_enter_year') + ": " + @applic.aksts_enter_year.to_s

	    move_down 10
      text I18n.t(:your_specialization), size: 18
      str11 = @applic.spec_astronomy ? "- #{I18n.t('activerecord.attributes.applic.spec_astronomy')+"\n"}" : ""
      str11 += @applic.spec_agriculture ? "- #{I18n.t('activerecord.attributes.applic.spec_agriculture')+"\n"}" : ""
      str11 += @applic.spec_aeronaft ? "- #{I18n.t('activerecord.attributes.applic.spec_aeronaft')+"\n"}" : ""
      str11 += @applic.spec_biotech_midicine ? "- #{I18n.t('activerecord.attributes.applic.spec_biotech_midicine') +"\n"}" : ""
      str11 += @applic.spec_geology ? "- #{I18n.t('activerecord.attributes.applic.spec_geology') +"\n"}" : ""
      str11 += @applic.spec_it ? "- #{I18n.t('activerecord.attributes.applic.spec_it') +"\n"}" : ""
      str11 += @applic.spec_shipbuilding ? "- #{I18n.t('activerecord.attributes.applic.spec_shipbuilding') +"\n"}" : ""
      str11 += @applic.spec_cryptography ? "- #{I18n.t('activerecord.attributes.applic.spec_cryptography')+"\n"} " : ""
      str11 += @applic.spec_maths ? "- #{I18n.t('activerecord.attributes.applic.spec_maths')+"\n"}" : ""
      str11 += @applic.spec_material ? "- #{I18n.t('activerecord.attributes.applic.spec_material')+"\n"}" : ""
      str11 += @applic.spec_carbuilding ? "- #{I18n.t('activerecord.attributes.applic.spec_carbuilding')+"\n"}" : ""
      str11 += @applic.spec_medicine ? "- #{I18n.t('activerecord.attributes.applic.spec_medicine')+"\n"}" : ""
      str11 += @applic.spec_mechanics ? "- #{I18n.t('activerecord.attributes.applic.spec_mechanics')+"\n"}" : ""
      str11 += @applic.spec_nanotech ? "- #{I18n.t('activerecord.attributes.applic.spec_nanotech')+"\n"}" : ""
      str11 += @applic.spec_tutoring ? "- #{I18n.t('activerecord.attributes.applic.spec_tutoring')+"\n"}" : ""
      str11 += @applic.spec_phsyhology ? "- #{I18n.t('activerecord.attributes.applic.spec_phsyhology')+"\n"}" : ""
      str11 += @applic.spec_pedology ? "- #{I18n.t('activerecord.attributes.applic.spec_pedology')+"\n"}" : ""
      str11 += @applic.spec_robototechnics ? "- #{I18n.t('activerecord.attributes.applic.spec_robototechnics')+"\n"}" : ""
      str11 += @applic.spec_sociology ? "- #{I18n.t('activerecord.attributes.applic.spec_sociology')+"\n"}" : ""
      str11 += @applic.spec_building_arcitecture_design ? "- #{I18n.t('activerecord.attributes.applic.spec_building_arcitecture_design')+"\n"}" : ""
      str11 += @applic.spec_physics ? "- #{I18n.t('activerecord.attributes.applic.spec_physics')+"\n"}" : ""
      str11 += @applic.spec_chemistry ? "- #{I18n.t('activerecord.attributes.applic.spec_chemistry')+"\n"}" : ""
      str11 += @applic.spec_energetics_electrotechnics ? "- #{I18n.t('activerecord.attributes.applic.spec_energetics_electrotechnics')+"\n"}" : ""
      str11 += !@applic.spec_other.blank? ? "#{I18n.t('activerecord.attributes.applic.spec_other')}: #{@applic.spec_other+"\n"}" : ""
      text str11      

	    move_down 10
	    text I18n.t(:your_add_info), size: 18
	    move_down 7
	    text I18n.t(:your_bal), size: 16
	    text I18n.t('activerecord.attributes.applic.bal_2013_spring') + ": " + @applic.bal_2013_spring.to_s 
	    text I18n.t('activerecord.attributes.applic.bal_2012_fall') + ": " + @applic.bal_2012_fall.to_s  
	    text I18n.t('activerecord.attributes.applic.bal_total') + ": " + @applic.bal_total.to_s 
	    move_down 7
	    text I18n.t(:your_social), size: 16
      str40 = @applic.social_work_yes ? "- #{I18n.t('activerecord.attributes.applic.social_work_yes')+"\n"}" : ""
      str40 += @applic.social_work_no ? "- #{I18n.t('activerecord.attributes.applic.social_work_no')+"\n"}" : ""
      text str40        
	    move_down 7
	    text I18n.t(:your_recomendations), size: 16
      str42 = @applic.recomendation_antok ? "- #{I18n.t('activerecord.attributes.applic.recomendation_antok')+"\n"}" : ""
      str42 += @applic.recomendation_not_antok ? "- #{I18n.t('activerecord.attributes.applic.recomendation_not_antok')+"\n"}" : ""
      str42 += @applic.recomendation_no ? "- #{I18n.t('activerecord.attributes.applic.recomendation_no')+"\n"}" : ""	  	  
      text str42

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