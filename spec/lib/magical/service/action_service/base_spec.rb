# frozen_string_literal: true

require 'spec_helper'

describe ActionService::Base do
  subject(:service) { described_class }

  describe '.provide' do
    let(:no_assignment_error) { Core::Gears::NoAssignmentError }

    before do
      service.instance_variable_set('@config', Core::Gears::ControlPanel.new)
    end

    context 'when doesn\'t assign the delivery stage' do
      it 'should return not defined error' do
        expect { service.provide }.to raise_error(no_assignment_error)
      end

      it 'should return a proper delivery stage error message' do
        expect { service.provide }.to raise_error.with_message(
          ":delivery wasn't assign for the service: #{service}"
        )
      end
    end

    context 'when assign the delivery stage without define it' do
      before do
        allow(service.config).to receive(:delivery).and_return(:bar)
      end

      it 'should return not defined error' do
        expect { service.provide }.to raise_error(no_assignment_error)
      end

      it 'should return a proper delivery stage error message' do
        expect { service.provide }.to raise_error.with_message(
          ":delivery wasn't assign for the service: #{service}"
        )
      end

      it 'should not respond to the delivery stage' do
        expect(service).not_to respond_to(:bar)
      end
    end

    context 'when assign stages without define them' do
      before do
        allow(service.config).to receive(:stages).and_return([:foo])
      end

      it 'should return not defined error' do
        expect { service.provide }.to raise_error(no_assignment_error)
      end

      it 'should return a proper stages error message ' do
        expect { service.provide }.to raise_error.with_message(
          "some :stages wasn't assign for the service: #{service}"
        )
      end

      it 'should not respond to the stages' do
        service.config.stages.each do |stage|
          expect(service).not_to respond_to(stage)
        end
      end
    end

    context 'when assign the delivery stage' do
      before do
        allow(service.config).to receive(:delivery).and_return(:bar)
        service.define_singleton_method(:bar) { {} }
      end

      it 'should successfully receive it' do
        expect(service).to receive(:bar)
        service.provide
      end

      it 'should successfully call it' do
        expect(service.provide).to eq({})
      end
    end

    context 'when assign the stages and the delivery stage' do
      before do
        stages = %i[foo baz qux plugh]
        allow(service.config).to receive(:stages).and_return(stages)
        allow(service.config).to receive(:delivery).and_return(:bar)

        stages.each_with_index do |stage, i|
          service.define_singleton_method(stage) { "stage #{i + 1} - #{__method__}" }
        end

        service.define_singleton_method(:bar) { params }
      end

      it 'should successfully receive the stages' do
        service.config.stages.each do |stage|
          expect(service).to receive(stage)
        end
        service.provide
      end

      it 'should successfully receive the delivery stage' do
        expect(service).to receive(:bar)
        service.provide
      end

      it 'should successfully call them' do
        expect(service.provide(params: { foo: :bar })).to eq(
          foo: :bar
        )
      end
    end
  end

  describe '.params' do
    context 'when assign default params' do
      before do
        allow(service.config).to receive(:params).and_return(:as_default)
      end

      it 'should return the default params' do
        expect(service.params).to eq(:as_default)
      end
    end

    context 'when pass params as argument' do
      before do
        allow(service.config).to receive(:delivery).and_return(:bar)
        allow(service.config).to receive(:params).and_return(:as_default)
        service.define_singleton_method(:bar) { params }
      end

      it 'should return the argument params' do
        expect(service).to receive(:params).and_return(:as_argument)
        service.provide(params: :as_argument)
      end
    end
  end

  describe '.options' do
    context 'when assign default options' do
      before do
        allow(service.config).to receive(:options).and_return(:as_default)
      end

      it 'should return the default options' do
        expect(service.options).to eq(:as_default)
      end
    end

    context 'when pass options as argument' do
      before do
        allow(service.config).to receive(:delivery).and_return(:bar)
        allow(service.config).to receive(:options).and_return(:as_default)
        service.define_singleton_method(:bar) { options }
      end

      it 'should return the argument options' do
        expect(service).to receive(:options).and_return(:as_argument)
        service.provide(options: :as_argument)
      end
    end
  end
end
