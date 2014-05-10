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

    describe "Generate Shorten Url" do
      let(:submit) { "Shorten" }

      describe "with invalid information" do
        it "should not create a share_link" do
          expect { click_button submit }.not_to change(ShareLink, :count)
        end
      end

      describe "with valid information" do
        before do
          fill_in "Original Url", with: "http://blog.ansuchan.com"
          fill_in "Shorten Url", with: "blog"
        end

        it "should create a share_link" do
          expect { click_button submit }.to change(ShareLink, :count).by(1)
        end
      end
    end
  end
end
