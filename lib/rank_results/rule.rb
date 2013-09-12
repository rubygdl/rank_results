module RankResults
  class Rule

    def initialize(object)
      raise 'Add a not nil object' if object.nil?
      @object = object
    end

    def apply
      raise 'You must implement apply method'
    end

  end

end
