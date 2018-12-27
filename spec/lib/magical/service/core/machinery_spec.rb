# frozen_string_literal: true

require 'spec_helper'

describe Core::Machinery do
  let(:dummy) { double('dummy') }

  before do
    dummy.extend(Core::Machinery)
  end

  it 'should set a stage' do
    expect { dummy.stage(:foo) { :bar } }.to(
      change { dummy.respond_to?(:foo) }.from(false).to(true)
    )
    expect(dummy.foo).to eq(:bar)
  end
end
