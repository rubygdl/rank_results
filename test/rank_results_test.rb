require 'helper'
Dir["test/rules/*.rb"].each {|file| require './' + file }
Dir["test/test_classes/*.rb"].each {|file| require './' + file }

describe RankResults::Valuator do
  before do
    instructors_followed = [1,2,3]
    @videos = [Video.new(tickets_sold: 2, likes: 3, user_id: 1), Video.new(tickets_sold: 4, likes: 1, user_id: 5)]
    instructor_followed_rule = InstructorsFollowedRule.new(@videos[0])
    instructor_followed_rule.instructors_followed = instructors_followed
    @valuator = RankResults::Valuator.new(@videos[0])
    @valuator.add_rule LikesRule.new @videos[0]
    @valuator.add_rule instructor_followed_rule
  end

  it "testing first rule" do
    @valuator.rank.must_equal 1020
  end

end
