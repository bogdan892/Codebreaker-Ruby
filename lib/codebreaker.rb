# frozen_string_literal: true

# Dir[ "codebreaker/modules/*.rb"].each { |file_name| require_relative file_name  }
# Dir[ "codebreaker/errors/*.rb"].each { |file_name| require_relative file_name }
require_relative 'codebreaker/config/constants'
require_relative 'codebreaker/errors/code_length_error'
require_relative 'codebreaker/errors/code_valid_error'
require_relative 'codebreaker/errors/difficulty_error'
require_relative 'codebreaker/errors/empty_name_error'
require_relative 'codebreaker/errors/short_name_error'
require_relative 'codebreaker/errors/long_name_error'
require_relative 'codebreaker/errors/wrong_number_error'
require_relative 'codebreaker/modules/validation'

require_relative 'codebreaker/version'
require_relative 'codebreaker/game'

module Codebreaker
end

b = Codebreaker::Game.new('sss')
a = '1524'
p b.input_code(a)
# p b.use_hint
# p b.use_hint
# p b.use_hint

#p b.lose?
