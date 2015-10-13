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
