require 'spec_helper'

describe Confession do

  let(:user) { FactoryGirl.create(:user) }
  before do
    # This code is wrong!
    @confession = Confession.new(number: 1, content: "Lorem ipsum", number_of_likes:0, number_of_dislikes:0, number_of_trolls: 0)
  end

  subject { @confession }

  it { should respond_to(:number) }
  it { should respond_to(:content) }
  it { should respond_to(:number_of_likes) }
  it { should respond_to(:number_of_dislikes) }
  it { should respond_to(:number_of_trolls) }

  it { should be_valid }

  describe "when content is not present" do
    before { @confession.content = nil }
    it { should_not be_valid }
  end
end