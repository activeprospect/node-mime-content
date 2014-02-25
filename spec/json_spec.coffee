assert = require('chai').assert
parse = require('../src/json')

describe 'JSON', ->

  it 'should retrieve object', ->
    content = '{"foo":"bar"}'
    assert.equal parse(content).foo, 'bar'
