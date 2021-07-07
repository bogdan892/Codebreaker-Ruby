# frozen_string_literal: true

module Codebreaker
  module Errors
    class LongName < StandardError
      MESSAGE_FIELD_ERROR = "Name must be shorter #{MAX_NAME_LENGTH}"

      def initialize
        super(MESSAGE_FIELD_ERROR)
      end
    end
  end
end
