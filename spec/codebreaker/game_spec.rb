# frozen_string_literal: true

require_relative '../spec_helper'

module Codebreaker
  include Errors
  include Validation
  RSpec.describe Game do
    let(:player) { described_class.new('Jack') }

    describe 'Generate code' do
      it 'numbers is not be empty' do
        expect(player.generate_code).not_to be_empty
      end

      it "counts numbers not equal #{CODE_SIZE}" do
        expect(player.generate_code.size).to eq CODE_SIZE
      end

      it "numberses must be between #{CODE_MIN} to #{CODE_MAX}" do
        player.generate_code.each do |number|
          expect(number.to_i).to be_between(CODE_MIN, CODE_MAX)
        end
      end
    end

    context 'when give hint' do
      it 'numbers witch contains secret code' do
        expect(player.instance_variable_get(:@secret_code)).to include(player.use_hint)
      end
    end

    context 'when ended game' do
      it 'ifs input code is not equal secret code' do
        player.instance_variable_set(:@secret_code, '1234'.chars)
        player.instance_variable_set(:@input_code, '4321'.chars)
        expect(player.won?).to eq(false)
      end

      it 'ifs attempts is not equal zero' do
        player.instance_variable_set(:@attempts, 0)
        expect(player.lose?).to eq(true)
      end
    end

    context 'Check if guess working correct' do
      params = [
        ['6543', '5643', '++--'],
        ['6543', '6411', '+-'],
        ['6543', '6544', '+++'],
        ['6543', '3456', '----'],
        ['6543', '6666', '+'],
        ['6543', '2666', '-'],
        ['6543', '2222', ''],
        ['6666', '1661', '++'],
        ['1234', '3124', '+---'],
        ['1234', '1524', '++-'],
        ['1234', '1234', '++++'],
        ['6211', '6322', '+-'],
        ['6322', '6211', '+-']
      ]
      it 'ifs input code is not equal secret code' do
        params.each do |value|
          player.instance_variable_set(:@secret_code, value[0].chars)
          expect(player.input_code(value[1])).to eq(value[2])
        end
      end
    end
  end
end
