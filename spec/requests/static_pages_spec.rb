require 'spec_helper'

describe "Static pages" do

  subject{ page }

  describe "Home" do
    before { visit root_path }

    it { should have_title("Library") }
    it { should have_selector('h1', text: "Welcome to the Library App") }
  end

  describe "About" do
    before { visit about_path }
    it { should have_title("About Us | Library") }
    it { should have_selector('h1', text: "About Us") }
  end

  describe "Contacts" do
    before { visit contacts_path }
    it { should have_title("Contacts | Library") }
    it { should have_selector('h1', text: "Contacts") }
  end

  describe "Help" do
    before { visit help_path }
    it { should have_title("Help | Library") }
    it { should have_selector('h1', text: "Help") }
  end
end
