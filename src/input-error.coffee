ReturnValue = require 'nanocyte-component-return-value'

NO_MESSAGE_ERROR = 'Error message received with no payload'

class InputError extends ReturnValue
  onEnvelope: (envelope) =>
    {message} = envelope

    if message.topic == 'error'
      errorMessage  = message.payload?.message
      errorMessage ?= 'Error message received with no payload'
      throw new Error errorMessage

    return message

module.exports = InputError
