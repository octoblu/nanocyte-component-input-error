ReturnValue = require 'nanocyte-component-return-value'

class InputError extends ReturnValue
  onEnvelope: (envelope) =>
    return envelope.message

module.exports = InputError
