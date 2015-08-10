require 'rails_helper'

describe PageTitleHelper, type: :helper do
  describe "#page_title with no options" do
    subject { helper.page_title }
    it { should == "Flutie" }
  end
  describe "#page_title with site name" do
    subject { helper.page_title(:app_name => 'Test') }
    it { should == "Test" }
  end
  describe "#page_title with content for page title" do
    before { helper.content_for(:page_title, 'page title') }
    subject { helper.page_title }
    it { should == "Flutie : page title" }
  end
  describe "#page_title with content for page title and reversed position" do
    before { helper.content_for(:page_title, 'page title') }
    subject { helper.page_title(:reverse => 1) }
    it { should == "page title : Flutie" }
  end
  describe "#page_title with content for page title and alternate separator" do
    before { helper.content_for(:page_title, 'page title') }
    subject { helper.page_title(:separator => ' | ') }
    it { should == "Flutie | page title" }
  end
  describe "#page_title with content for alternate symbol" do
    before { helper.content_for(:alt_page_title, 'page title') }
    subject { helper.page_title(:page_title_symbol => :alt_page_title) }
    it { should == "Flutie : page title" }
  end
end
