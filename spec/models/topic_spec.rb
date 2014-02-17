require 'spec_helper'

describe Topic do
  before { @topic = Topic.new(topic: "Ruby News") }
  subject { @topic }
  it { should respond_to(:topic) }
  it { should be_valid } 
  describe "when topic is already taken" do
    before do
      same_topic = @topic.dup
      same_topic.save
    end
    it { should_not be_valid }
  end

  describe "when name is not present" do
    before { @topic.topic = " " }
    it { should_not be_valid }
  end
end
