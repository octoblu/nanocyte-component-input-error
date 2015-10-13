ReturnValue = require 'nanocyte-component-return-value'
InputError = require '../src/input-error'

describe 'InputError', ->
  beforeEach ->
    @sut = new InputError

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        expect(@sut.onEnvelope({message: 'anything'})).to.deep.equal 'anything'

    describe 'when called with an envelope that has an error topic', ->
      it 'should return the message', ->
        envelope =
          message:
            topic: 'error'
            payload:
              message: 'Practical Joke'

        expect(=> @sut.onEnvelope envelope).to.throw 'Practical Joke'


    describe 'when called with an envelope that has another error topic', ->
      it 'should return the message', ->
        envelope =
          message:
            topic: 'error'
            payload:
              message: 'Inability to understand metaphors'

        expect(=> @sut.onEnvelope envelope).to.throw 'Inability to understand metaphors'

    describe 'when called with an envelope that has another error topic but no message', ->
      it 'should return the message', ->
        envelope =
          message:
            topic: 'error'

        expect(=> @sut.onEnvelope envelope).to.throw 'Error message received with no payload'
