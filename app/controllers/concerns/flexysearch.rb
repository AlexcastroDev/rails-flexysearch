module Flexysearch extend ActiveSupport::Concern
  class Paginate
    attr_reader :collection

    def initialize(model:)
      @collection = model.all
    end

    # @todo: Implement pagination
    def paginate
      @collection = @collection.limit(10)
    end
  end
end