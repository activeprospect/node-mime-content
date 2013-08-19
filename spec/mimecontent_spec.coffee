assert = require('chai').assert
content = require('../src/mimecontent')

describe 'MIME Content', ->

  it 'should parse JSON', ->
    parsed = content('{"foo":"bar"}', 'application/json')
    assert.equal parsed.foo, 'bar'

  it 'should parse application XML', ->
    parsed = content('<foo>bar</foo>', 'application/xml')
    assert.equal parsed.xpath('//foo/text()').data, 'bar'

  it 'should parse text XML', ->
    parsed = content('<foo>bar</foo>', 'text/xml')
    assert.equal parsed.xpath('//foo/text()').data, 'bar'

  it 'should parse HTML', ->
    parsed = content('<html><body><h1>Header!</h1></body></html>', 'text/html')
    assert.equal parsed('h1').text(), 'Header!'

  it 'should parse URL encoded', ->
    parsed = content('foo=bar', 'application/x-www-form-urlencoded')
    assert.equal parsed.foo, 'bar'

  it 'should not parse in the absence of a content type', ->
    value = content('foo=bar')
    assert.equal value, 'foo=bar'

  it 'should not parse on unknown content type' , ->
    value = content('foo=bar', 'text/donkies')
    assert.equal value, 'foo=bar'