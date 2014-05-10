require 'spec_helper'

describe "Share Links" do
  subject { page }
  describe "Index Page" do
    before { visit share_links_path }
    it { should have_content "Share Links" }
  end

  describe "New Page" do
    before { visit new_share_link_path }
    it { should have_content "New Share Links" }
  end
end
