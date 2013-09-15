require 'spec_helper'

describe Applic do
	let(:user) { FactoryGirl.create(:user) }

	# before { @applic = user.build_applic(fio_rus: "Klish Mih Rus")}
    
    let(:applic) {FactoryGirl.build(:applic, user: user)}

	subject { applic }

	it { should respond_to(:student) }
	it { should respond_to(:spec_maths) }
	it { should respond_to(:fio_rus) }
	it { should respond_to(:spec_maths) }
	it { should respond_to(:phone_home) }
	it { should respond_to(:aksts_events_participation) }
	it { should respond_to(:email) }
	it { should respond_to(:birth) }
	it { should respond_to(:aksts_enter_year) }
	it { should respond_to(:q_your_values) }
	it { should respond_to(:bal_total) }
	it { should respond_to(:bal_2013_spring) }
	it { should respond_to(:bal_2012_fall) }
	it { should respond_to(:user_id) }
	it { should respond_to(:user) }
	it { should respond_to(:sent) }
	its(:user) { should == user}

	it { should be_valid}

	describe "when user_id is not present" do
		before { applic.user_id = nil }
		it { should_not be_valid }
	end

	describe "when fio_rus is not present" do
		before { applic.fio_rus = nil }
		it { should_not be_valid }
	end

	describe "when fio_rus is short" do
		before { applic.fio_rus = "qwer" }
		it { should_not be_valid }
	end

	describe "when bal_total is not present" do
		before { applic.bal_total = nil }
		it { should_not be_valid }
	end

end
