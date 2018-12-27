# frozen_string_literal: true

require_relative 'action_service/base'

# action service module
module ActionService
  # # a service example:
  #
  # class BarService < ActionService::Base
  #   before_confection do
  #     define_params :default_param # optional
  #     define_options :default_option # optional
  #     define_stages %i[one two three] # optional
  #     define_delivery :four
  #   end
  #
  #   stage :one do
  #     # body omitted
  #   end
  #
  #   stage :two do
  #     stage_helper(foo, bar)
  #     # body omitted
  #   end
  #
  #   stage :three do
  #     # body omitted
  #     stage_helper2(baz)
  #   end
  #
  #   stage :four do
  #     # body omitted
  #   end
  #
  #   # one-line support action
  #   mainstay(:stage_helper) { |foo, bar| # body omitted }
  #
  #   # multi-line support action
  #   mainstay(:stage_helper2) do |baz|
  #     # body omitted
  #   end
  # end
end
