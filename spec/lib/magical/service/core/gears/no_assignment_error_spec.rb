# frozen_string_literal: true

require 'spec_helper'

describe Core::Gears::NoAssignmentError do
  let(:dummy) { double('dummy') }

  it 'should return a proper error with a proper message ' do
    expect { raise described_class.new(:test, dummy) }.to(
      raise_error(described_class).with_message(
        "test wasn't assign for the service: #{dummy}"
      )
    )
  end
end
