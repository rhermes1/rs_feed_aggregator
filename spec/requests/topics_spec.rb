require 'spec_helper'

describe "Topics" do
  describe "Topic Index" do
    it "should have content 'All rss-Topics'" do
      visit '/topics'
      expect(page).to have_content('All rss-Topics')
    end
    it "should have title 'rss Topics'" do
      visit '/topics'
      expect(page).to have_title('rss Topics')
    end
  end
end
