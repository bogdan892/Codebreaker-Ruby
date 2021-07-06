# frozen_string_literal: true

module Codebreaker
  DIFFICULTY = { 'easy' => { attempts: 15, hints: 2 },
                 'medium' => { attempts: 10, hints: 1 },
                 'hard' => { attempts: 5, hints: 1 } }.freeze
  COMPARE_EQUAL = '+'.freeze
  COMPARE_FIND = '-'.freeze
  WINNING_RESULT = '++++'.freeze
  MIN_NAME_LENGTH = 3
  MAX_NAME_LENGTH = 20
  CODE_SIZE = 4
  CODE_MIN = 1
  CODE_MAX = 6
end
