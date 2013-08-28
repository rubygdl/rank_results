require 'rank_results/rule'

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

end
