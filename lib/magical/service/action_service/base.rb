# frozen_string_literal: true

require 'magical/service/core/gears'
require 'magical/service/core/machinery'

module ActionService
  # Service base conveniences for your service objects.
  #
  # This class allows you to define services based on a
  # suggested convention, with will execute through a single action.
  # Then your service can define stages of forced void return and a
  # delivery method, which will process data and return it
  #
  #   class MyService < ActionService::Base
  #     before_confection do
  #       define_stages %i[one two] # optional
  #       define_delivery :three
  #     end
  #
  #     stage :one do { # body omitted }
  #     stage :two do { # body omitted }
  #     stage :three do { # body omitted }
  #   end
  #
  # Then your service can do all the process by simply calling:
  #
  #   MyService.provide(params: {}, options: {})
  #
  class Base
    extend Core::Gears
    extend Core::Machinery
  end
end
