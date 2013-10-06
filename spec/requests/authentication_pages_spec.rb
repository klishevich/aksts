require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { find('#h1_sign_in')}
  end

  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "sign_in" }

      it { find('#h1_sign_in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "sign_in"
      end

      it { find('#goto_profile')}
      it { find('#goto_settings')}
      it { find('#goto_exit') }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link 'goto_exit' }
        it { should have_link('goto_signin') }
      end
    end  
  end

  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in "Email",    with: user.email
          fill_in "Password", with: user.password
          click_button "sign_in"
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_selector('h1', text: 'Update your profile')
          end
        end
      end

      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { find('#h1_sign_in') }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end

        describe "visiting the user index" do
          before { visit users_path }
          it { find('#h1_sign_in')}
        end
      end
    end

    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, email: "wrong@example.com") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('h1', text: 'Update your profile') }
      end

      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_url) }
      end
    end    

    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { sign_in non_admin }

      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { response.should redirect_to(root_url) }
      end

      describe "view applics" do
        before { visit applics_path }
        it { find('#h1_welcome_aksts') }
      end

      describe "view applic page" do
        before {visit "/applics/#{user.applic}"}
        it { find('#h1_welcome_aksts') }
      end

    end

    describe "as admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:applic) { FactoryGirl.create(:applic, user: user)}
      let(:admin) { FactoryGirl.create(:admin) }

      before { sign_in admin}

      describe "view applics" do
        before {visit applics_path}
        it { find('#h1_all_applics') }
        # it { should have_link("/applics/#{applic.id}") }
      end

      describe "view applic page" do
        before {visit "/applics/#{user.applic}"}
        # it { find('#h1_your_application_details') }
      end
    end

  end  
end
