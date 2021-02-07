# frozen_string_literal: true

module Codebreaker
  module Errors
    class DifficultyError < StandardError
      MESSAGE_FIELD_ERROR = "Difficulty must be 'easy' , 'medium' or 'hard'"

      def initialize
        super(MESSAGE_FIELD_ERROR)
      end
    end
  end
end
