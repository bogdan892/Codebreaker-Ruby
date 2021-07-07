# frozen_string_literal: true

module Codebreaker
  class Game
    include Validation

    attr_reader :user, :difficulty
    attr_accessor :secret_code, :secret_code_for_hints

    def initialize(user, difficulty = 'medium')
      check_user(user)
      check_difficulty(difficulty)
      @user = user
      @difficulty = difficulty
      @attempts = DIFFICULTY[difficulty][:attempts]
      @hints = DIFFICULTY[difficulty][:hints]
      @secret_code = generate_code
      @secret_code_for_hints = @secret_code.shuffle
    end

    def input_code(input_code)
      @attempts -= 1 if @attempts.positive?
      check_code(input_code)
      @input_code = input_code.chars
      @code_comprasions = @input_code.clone
      @code = @secret_code.clone
      start_math.join + end_math.join
    end

    def generate_code
      Array.new(CODE_SIZE) { rand(CODE_MIN..CODE_MAX).to_s }
    end

    def secrete_code
      @secret_code.join
    end

    def use_hint
      return false unless @hints.positive?

      @hints -= 1
      @secret_code_for_hints.pop
    end

    def won?
      @secret_code == @code_comprasions
    end

    def lose?
      !won? && @attempts.zero?
    end

    def to_h
      {
        name: @user,
        difficulty: @difficulty,
        attempts_total: DIFFICULTY[@difficulty][:attempts],
        attempts_used: (DIFFICULTY[@difficulty][:attempts] - @attempts),
        hints_total: DIFFICULTY[@difficulty][:hints],
        hints_used: (DIFFICULTY[@difficulty][:hints] - @hints)
      }
    end

    private

    def start_math
      @input_code.map.with_index do |_char, index|
        if @input_code[index] == @code[index]
          @code[index], @input_code[index] = ''
          COMPARE_EQUAL
        end
      end
    end

    def end_math
      @input_code.map.with_index do |_char, index|
        if @code.include? @input_code[index]
          index_input = @input_code[index]
          @code[@code.index(index_input)] = '-'
          COMPARE_FIND
        end
      end
    end
  end
end
