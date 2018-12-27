# frozen_string_literal: true

require 'spec_helper'

describe Core::Gears::ControlPanel do
  describe '#define_attribute' do
    subject(:control_panel) { described_class.new }

    it 'should successfully set the attributes' do
      described_class::ATTRIBUTES.each do |attribute|
        expect { control_panel.send("define_#{attribute}", attribute) }.to(
          change { control_panel.send(attribute) }.from(nil).to(attribute)
        )
      end
    end
  end
end
