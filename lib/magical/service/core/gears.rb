# frozen_string_literal: true

require_relative 'gears/control_panel'
require_relative 'gears/no_assignment_error'

module Core
  # service gears
  module Gears
    def provide(params: {}, options: {})
      validates_confection do
        @params = params unless default_attribute?(:params, params)
        @options = options unless default_attribute?(:options, options)
      end

      chain do
        clear_virtual_instance_variables
      end
    end

    def before_confection(&block)
      config.instance_eval(&block)
    end

    def chain
      config.stages.each { |method| send(*method) } if stages?

      result = send(*config.delivery)
      yield
      result
    end

    def clear_virtual_instance_variables
      remove_instance_variable(:@params) if defined?(@params)
      remove_instance_variable(:@options) if defined?(@options)
    end

    def config
      @config ||= ControlPanel.new
    end

    def default_attribute?(attribute, value)
      !config.send(attribute).nil? && value.is_a?(Hash) && value.empty?
    end

    def defined_stages?
      config.stages.all? { |phase| respond_to?(phase) }
    end

    def delivery?
      defined?(@config) && !config.delivery.nil? && respond_to?(config.delivery)
    end

    def not_defined_error(action)
      NoAssignmentError.new(action, self)
    end

    def options
      defined?(@options) ? @options : (@options = config.options)
    end

    def params
      defined?(@params) ? @params : (@params = config.params)
    end

    def stages?
      defined?(@config) && !config.stages.nil?
    end

    def validates_confection
      raise not_defined_error('some :stages') if stages? && !defined_stages?
      raise not_defined_error(':delivery') unless delivery?

      yield
    end
  end
end
