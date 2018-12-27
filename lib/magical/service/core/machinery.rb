# frozen_string_literal: true

module Core
  # Machinery which possibility the services stages attribution
  module Machinery
    def stage(name)
      define_singleton_method(name, &Proc.new)
    end

    alias mainstay stage
  end
end
