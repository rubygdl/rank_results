class LikesRule < RankResults::Rule

  def apply
    @object.tickets_sold * 10
  end

end
