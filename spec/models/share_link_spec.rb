require 'spec_helper'

describe ShareLink do
  before do
    @share_link = ShareLink.new( original_url: "http://ansuchan.com",
                                shorten_url: "homepage" )
  end
  subject { @share_link }

  it { should respond_to :original_url }
  it { should respond_to :shorten_url }

  describe "Original Url" do
    describe "is not presence" do
      before { @share_link.original_url = "" }
      it { should_not be_valid }
    end

    describe "is not unique" do
      before do
        share_link_with_same_original_url = ShareLink.new
        share_link_with_same_original_url.original_url = @share_link.original_url
        share_link_with_same_original_url.shorten_url = "new shorten url"
        share_link_with_same_original_url.save
      end

      it { should_not be_valid }
    end
  end

  describe "Shorten Url" do
    describe "is not presence" do
      before { @share_link.shorten_url = "" }
      it { should_not be_valid }
    end

    describe "is too short" do
      # minimum length is 4 ( XXXX )
      before { @share_link.shorten_url = "a"*3 }
      it { should_not be_valid }
    end

    describe "is not unique" do
      before do
        share_link_with_same_shorten_url = ShareLink.new
        share_link_with_same_shorten_url.original_url = "new original url"
        share_link_with_same_shorten_url.shorten_url = @share_link.shorten_url
        share_link_with_same_shorten_url.save
      end

      it { should_not be_valid }
    end
  end

end
