class Video

  attr_accessor :tickets_sold, :likes, :user_id

  def initialize(params)
    params.each {|key,value| send("#{key}=",value)}
  end

end