assert = require('chai').assert
parse = require('../src/html')

describe 'HTML', ->

  it 'should be coercable to a string', ->
    content = '<html><body></body></html>'
    assert.equal parse(content).toString(), content

  it 'should retrieve element by css selector', ->
    content = '<html><body><h1 class="klass">foo</h1></foo>'
    assert.equal parse(content)('h1.klass').text(), 'foo'
