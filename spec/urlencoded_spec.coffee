assert = require('chai').assert
parse = require('../src/urlencoded')

describe 'URL encoded', ->

  it 'should be coercable to a string', ->
    content = 'foo=bar&baz=bip'
    assert.equal parse(content).toString(), content

  it 'should retrieve object', ->
    content = 'foo=bar&baz=bip'
    parsed = parse(content)
    assert.equal parsed.foo, 'bar'
    assert.equal parsed.baz, 'bip'

  it 'should parse multiple keys of the same name into an array', ->
    content = 'foo=bar&foo=baz'
    assert.sameMembers parse(content).foo, ['bar', 'baz']
