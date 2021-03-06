require 'spec_helper'

describe "Static pages" do

  subject{ page }

  shared_examples_for "all static pages" do
    it { should have_title(full_title title) }
    it { should have_selector('h1', text: heading) }
  end

  describe "Home" do
    before { visit root_path }

    let(:title) { "" }
    let(:heading) { "Welcome to the Library App" }

    it_should_behave_like "all static pages"
  end

  describe "About" do
    before { visit about_path }

    let(:title){ "About Us" }
    let(:heading){ "About Us" }

    it_should_behave_like "all static pages"
  end

  describe "Contacts" do
    before { visit contacts_path }

    let(:title){ "Contacts" }
    let(:heading){ "Contacts" }

    it_should_behave_like "all static pages"
  end

  describe "Help" do
    before { visit help_path }

    let(:title){ "Help" }
    let(:heading){ "Help" }

    it_should_behave_like "all static pages"
  end

  it "should have right links on the layout" do
      visit root_path
      click_link "Help"
      expect(page).to have_title(full_title "Help")
      click_link "Home"
      expect(page).to have_title(full_title "")
      click_link "Contacts"
      expect(page).to have_title(full_title "Contacts")
      click_link "Library"
      expect(page).to have_title(full_title "")
      click_link "About Us"
      expect(page).to have_title(full_title "About Us")
  end
end
