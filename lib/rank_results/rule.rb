module RankResults
  class Rule

    def initialize(object)
      @object = object
    end

    def apply
      raise "You must implement apply method"
    end

  end

end
