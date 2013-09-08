require 'spec_helper'

describe "Static pages" do
  subject {page}

  before {visit root_path}

  it {should have_selector('h1', text: 'Welcome to AKSTS')}

  it "should have the right links on the layout" do
    click_link "About"
    page.should have_selector 'h1', text: 'About AKSTS'
    click_link "Help"
    page.should have_selector 'h1', text: 'Help'
    click_link "Contact"
    page.should have_selector 'h1', text: 'Contacts'
    click_link "Home"
    page.should have_selector 'h1', text: 'Welcome to AKSTS'
  end
end