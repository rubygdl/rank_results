module RankResults
  class Valuator

    def self.rules
      @rules ||= []
    end

    def self.add_rule(rule)
      self.rules << rule
    end

    def initialize(object)
      @object = object
    end

    def rank
      Valuator.rules.inject(0) { |result, rule| result + rule.apply } 
    end

  end

  class Rule

    def initialize(object)
      @object = object
    end

    def apply
      raise "You must implement apply method"
    end

  end

  class LikesRule < Rule

    def apply
      @object.tickets_sold * 10
    end

  end

  class InstructorsFollowedRule < Rule

    attr_accessor :instructors_followed

    def apply
      @instructors_followed.include?(@object.user_id) ? 1000 : 0
    end
  end

end

class Video

  attr_accessor :tickets_sold, :likes, :user_id

  def initialize(params)
    params.each {|key,value| send("#{key}=",value)}
  end

end