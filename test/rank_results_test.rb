require 'helper'

describe RankResults::Valuator do
  before do
    instructors_followed = [1,2,3]
    @videos = [Video.new(tickets_sold: 2, likes: 3, user_id: 1), Video.new(tickets_sold: 4, likes: 1, user_id: 5)]
    instructor_followed_rule = RankResults::InstructorsFollowedRule.new(@videos[0])
    instructor_followed_rule.instructors_followed = instructors_followed
    RankResults::Valuator.add_rule RankResults::LikesRule.new @videos[0]
    RankResults::Valuator.add_rule instructor_followed_rule
  end

  it "testing first rule" do
    RankResults::Valuator.new(@videos[0]).rank.must_equal 1020
  end

end
