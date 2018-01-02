# This file is for custom exceptions
class IllegalContent < StandardError
  def initialize(msg = 'Content contains illegal values')
    super
  end
end