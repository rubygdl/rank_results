class InstructorsFollowedRule < RankResults::Rule

  attr_accessor :instructors_followed

  def apply
    @instructors_followed.include?(@object.user_id) ? 1000 : 0
  end

end
