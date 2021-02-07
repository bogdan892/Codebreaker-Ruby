# frozen_string_literal: true

module Codebreaker
  module Errors
    class CodeLengthError < StandardError
      WRONG_NUMBER = "must be #{CODE_SIZE} numbers"

      def initialize
        super(WRONG_NUMBER)
      end
    end
  end
end
