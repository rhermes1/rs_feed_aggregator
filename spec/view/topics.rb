require 'spec_helper'

describe "topics/index" do 
  it "should have the content 'All Topic'" do
    visit '/topics/index.html'
    expect(page).to have_content('All Topic')
  end
end
