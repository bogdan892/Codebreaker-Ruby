# frozen_string_literal: true

module Codebreaker
  module Errors
    class CodeValidError < StandardError
      MESSAGE_FIELD_ERROR = "Code must be between #{CODE_MIN} and #{CODE_MAX}"

      def initialize
        super(MESSAGE_FIELD_ERROR)
      end
    end
  end
end
