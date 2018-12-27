# frozen_string_literal: true

module Core
  module Gears
    # Gears Control Panel which handles the basic services configuration
    class ControlPanel
      ATTRIBUTES = %i[stages delivery params options].freeze

      attr_accessor(*ATTRIBUTES)

      ATTRIBUTES.each do |attr|
        define_method attr do
          instance_variable_get("@#{attr}")
        end

        define_method "define_#{attr}" do |value|
          instance_variable_set("@#{attr}", value)
        end
      end
    end
  end
end
