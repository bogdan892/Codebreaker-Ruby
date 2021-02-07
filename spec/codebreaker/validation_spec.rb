# frozen_string_literal: true

# require 'lib/modules/validation'
require_relative '../spec_helper'

module Codebreaker
  RSpec.describe Validation do
    subject(:validation) { Class.new { extend Validation } }
    describe 'When player type name' do
      let(:short_name) { 'q' }
      let(:empty_name) { '' }
      let(:long_name) { 'foooooooooooooooooooo' }

      it 'should if name length is short' do
        expect { validation.check_user(short_name) }.to raise_error(ShortName)
      end

      it 'should if name is empty' do
        expect { validation.check_user(empty_name) }.to raise_error(EmptyName)
      end

      it 'should if name length is long' do
        expect { validation.check_user(long_name) }.to raise_error(LongName)
      end
    end

    describe 'When player type incorrect difficulty' do
      let(:player) { Game.new('Jack', 'foo') }

      it 'should incorrect length' do
        expect { check_difficulty(player.difficulty) }.to raise_error(DifficultyError)
      end
    end

    describe 'When player type input code' do
      let(:negative_nubmer) { '321' }
      let(:incorrect_number) { '9876' }

      it 'should is number length is incorrect ' do
        expect { validation.code_length(negative_nubmer) }.to raise_error(CodeLengthError)
      end

      it "should is number incorrect between #{CODE_MIN} and #{CODE_MAX} " do
        expect { validation.code_is_valid?(incorrect_number) }.to raise_error(CodeValidError)
      end
    end
  end
end
