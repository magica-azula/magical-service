# frozen_string_literal: true

module Core
  module Gears
    # error of action not assigned
    class NoAssignmentError < StandardError
      def initialize(action, service)
        super("#{action} wasn't assign for the service: #{service}")
      end
    end
  end
end
