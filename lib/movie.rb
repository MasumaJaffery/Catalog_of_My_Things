require_relative './item'

class Movie > Item
    attr_accessor: selint
    def initialize(selint)
        @selint = selint
    end

    def can_be_archived?
        return true if super(can_be_archived) = true else false
end