# frozen_string_literal: true

module SpreeOrderNotes
  module Spree
    module ProductDecorator
      def self.prepended(base)
        base.has_many :notes, as: :notable if ::SpreeNotes::Config[:noteables].include?(base.table_name)
      end
    end
  end
end

if ::Spree::Product.included_modules.exclude?(SpreeOrderNotes::Spree::ProductDecorator)
  ::Spree::Product.prepend SpreeOrderNotes::Spree::ProductDecorator
end
