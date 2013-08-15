assert = require('chai').assert
parse = require('../src/xml')

describe 'XML', ->

  it 'should be coercable to a string', ->
    content = '<foo><bar></bar></foo>'
    assert.equal parse(content).toString(), content

  it 'should retrieve attribute', ->
    content = '<foo><bar id="attr"></bar></foo>'
    assert.equal parse(content)('//bar/@id'), 'attr'

  it 'should retrive multiple attributes', ->
    content = '<bars><bar id="attr1"/><bar id="attr2"/></bars>'
    assert.sameMembers parse(content)('//bar/@id', true), ['attr1', 'attr2']

  it 'should retrieve element text', ->
    content = '<foo><bar>text</bar></foo>'
    assert.equal parse(content)('//bar/text()'), 'text'

  it 'should retrieve multiple element texts', ->
    content = '<bars><bar>text1</bar><bar>text2</bar></bars>'
    assert.sameMembers parse(content)('//bar/text()', true), ['text1', 'text2']
