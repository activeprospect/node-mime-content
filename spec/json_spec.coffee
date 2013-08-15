assert = require('chai').assert
parse = require('../src/json')

describe 'JSON', ->

  it 'should be coercable to a string', ->
    content = '{"foo":"bar"}'
    assert.equal parse(content).toString(), content

  it 'should retrieve object', ->
    content = '{"foo":"bar"}'
    assert.equal parse(content).foo, 'bar'
