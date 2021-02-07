# frozen_string_literal: true

module Codebreaker
  module Validation
    include Errors
    def check_user(name)
      raise EmptyName if name.empty?
      raise ShortName if name.length < MIN_NAME_LENGTH
      raise LongName if name.length > MAX_NAME_LENGTH
    end

    def check_difficulty(params)
      raise DifficultyError unless DIFFICULTY.include?(params)
    end

    def check_code(input_code)
      code_length(input_code)
      code_is_valid?(input_code)
    end

    def code_length(input_code)
      raise CodeLengthError unless input_code.to_s.size == CODE_SIZE
    end

    def code_is_valid?(input_code)
      input_code.chars.each { |number| raise CodeValidError unless number.to_i.between?(CODE_MIN, CODE_MAX) }
    end
  end
end
