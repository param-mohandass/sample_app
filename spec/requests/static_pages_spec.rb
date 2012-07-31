require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    it "should have these in home page" do
      visit root_path
      should have_selector('h1',    text: 'Sample App')
      should have_selector('title', text: full_title('')) 
      should_not have_selector('title', text: '| Home')
    end
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    should have_selector 'title', text: full_title('About Us')
    click_link "Contact"
    should have_selector 'title', text: full_title('Contact')
  end

end