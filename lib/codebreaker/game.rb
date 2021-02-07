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
      @code = @secret_code.clone
      start_math.join + end_math.join
    end

    def generate_code
      Array.new(CODE_SIZE) { rand(CODE_MIN..CODE_MAX).to_s }
    end

    def use_hint
      return 'false' unless @hints.positive?

      @hints -= 1
      @secret_code_for_hints.pop
    end

    def won?
      @secret_code == @input_code
    end

    def lose?
      !won? && @attempts.zero?
    end

    def to_h
      {
        name: @user,
        difficulty: @difficulty,
        attempts_total: @attempts,
        attempts_used: (@attempts - DIFFICULTY[@difficulty][:attempts]),
        hints_total: @hints,
        hints_used: (@hints - DIFFICULTY[@difficulty][:hints])
      }
    end

    private

    def start_math
      @input_code.map.with_index do |_a, i|
        if @input_code[i] == @code[i]
          @code[i], @input_code[i] = ''
          COMPARE_EQUAL
        end
      end
    end

    def end_math
      @input_code.map.with_index do |_a, i|
        if @code.include? @input_code[i]
          index_input = @input_code[i]
          @code[@code.index(index_input)] = '-'
          COMPARE_FIND
        end
      end
    end
  end
end
