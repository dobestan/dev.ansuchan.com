require 'spec_helper'

describe "Welcomes" do
  subject { page }
  describe "Home Page" do
    before { visit root_path }
    it { should have_content "hello world" }
  end
end
