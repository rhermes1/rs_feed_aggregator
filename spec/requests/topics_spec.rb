require 'spec_helper'

describe "Topics" do
  subject { page }
  describe "Topic Index" do
    before { visit root_path }
    it { should have_content('All rss-Topics') }
    it { should have_title('RSS Topics') }
    it "should have right links" do
      click_link "New Topic"
      expect(page).to have_title('New Topic')
    end
  end

  describe "New Topic" do
    before { visit '/topics/new' }
    it { should have_content('New Topic') }
    it { should have_title('New Topic') }
    it "should have right links" do
      click_link "Back"
      expect(page).to have_title('RSS Topics')
    end
  end
end
