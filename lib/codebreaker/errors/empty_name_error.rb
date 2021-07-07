# frozen_string_literal: true

module Codebreaker
  module Errors
    class EmptyName < StandardError
      MESSAGE_FIELD_ERROR = 'It cannot be empty'

      def initialize
        super(MESSAGE_FIELD_ERROR)
      end
    end
  end
end
