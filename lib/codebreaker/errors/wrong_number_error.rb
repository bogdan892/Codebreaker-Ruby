# frozen_string_literal: true

module Codebreaker
  module Errors
    class WrongNumber < StandardError
      WRONG_NUMBER = 'not a number!'

      def initialize
        super(WRONG_NUMBER)
      end
    end
  end
end
