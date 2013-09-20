require 'spec_helper'

describe "Static pages" do
  subject {page}

  before {visit root_path}

  it { find('#h1_welcome_aksts') } 

  it "should have the right links on the layout" do
    click_link 'goto_about_antok'
    page.should have_selector 'h1', text: 'About AKSTS'
    click_link 'goto_contacts'
    page.should have_selector 'h1', text: 'Contacts'
    click_link 'goto_home'
    find('#h1_welcome_aksts')
  end
end