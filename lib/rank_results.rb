require 'rank_results/rule'

module RankResults
  class Valuator

    def rules
      @rules ||= []
    end

    def add_rule(rule)
      self.rules << rule
    end

    def initialize(object)
      @object = object
    end

    def rank
      rules.inject(0) { |result, rule| result + rule.apply } 
    end

  end

end
