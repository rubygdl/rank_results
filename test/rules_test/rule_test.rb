require 'helper'

class ExampleBrokenRule < RankResults::Rule
end

class ExampleRule < RankResults::Rule
  def apply
    @object.tickets_sold * 10
  end
end

describe RankResults::Rule do
  before do
    @videos = [Video.new(tickets_sold: 2, likes: 3, user_id: 1), Video.new(tickets_sold: 4, likes: 1, user_id: 5)]
  end

  it "should raise an exception if apply is not defined" do
    proc {ExampleBrokenRule.new(@videos[0]).apply}.must_raise RuntimeError
  end

  it "should return the value for the given rule" do
    ExampleRule.new(@videos[0]).apply.must_equal 20
  end

  it "should do something with nil object" do
    proc {ExampleRule.new(nil)}.must_raise RuntimeError
  end
end
