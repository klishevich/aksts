require 'spec_helper'

describe "ApplicPages" do
  
  subject { page }

  describe "Signin" do
    let(:user) { FactoryGirl.create(:user) }
	before do
	  visit signin_path
	  fill_in "Email",    with: user.email.upcase
	  fill_in "Password", with: user.password
	  click_button 'sign_in'
	end

	# it { should have_selector('h1', text: :grant_contest) }
	it { find('#sign_up_to_contest')[:href].should == apply_path } 
		# should have_link('Sign up for contest!', href: apply_path) }

	describe "fill_in application form" do
	  before do 
	  	# visit apply_path
	  	click_link "sign_up_to_contest"
	  	page.check('applic_student')
	  	page.check('applic_spec_maths')
	  	fill_in "applic_fio_rus", with: "Mihail Klishevich Rus"
	  	fill_in "applic_fio_eng", with: "Mihail Klishevich Eng"
	  	fill_in "applic_post_address", with: "Russia, Moscow, Mechera 6/2-108"
	  	fill_in "applic_phone_home", with: "+79139238446"
	  	page.check('applic_sex_m')
	  	fill_in "applic_university", with: "Novosibirsk State University"
	  	fill_in "applic_study_year", with: 3
	  	fill_in "applic_email", with: "mans1@ngs.ru"
	  	fill_in "applic_birth", with: "1981-06-29"
	 
	  	fill_in "applic_q_your_values", with: "no"
	  	fill_in "applic_q_your_contribution", with: "no"
	  	fill_in "applic_q_your_problem_solving", with: "no"

	  	fill_in "applic_bal_2013_spring", with: "4.7"
	  	fill_in "applic_bal_2012_fall", with: "5"
	  	fill_in "applic_bal_total", with: "4.5"
	  	page.check('applic_social_work_yes')
	  	page.check('applic_recomendation_not_antok')

	  	click_button "btn-save"
	  end

	  it { find('#h1_your_application_details')}
	  it { should have_selector('div.alert.alert-success') }
	  it { should have_no_content('foo') }
	  it do
	  	my_check = find_field('applic_student')
	  	my_check.should be_checked
	  end

	  describe "go home" do
	  	before do 
	  		click_link "btn-home"
	  		click_link "btn_view_application"
	  	end
	  	it { find('#h1_your_application_details') }
	  end

	  # my_check = find_field('Student')
	  # my_check.should be_checked
	end	
  end

end
