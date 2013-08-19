assert = require('chai').assert
parse = require('../src/xml')

describe 'XML', ->

  it 'should be coercable to a string', ->
    content = '<foo><bar/></foo>'
    assert.equal parse(content).toString(), content

    content = '<bars><bar>text1</bar><bar>text2</bar></bars>'
    assert.equal parse(content).toString(), content

  it 'should retrieve attribute', ->
    content = '<foo><bar id="attr"></bar></foo>'
    assert.equal parse(content).xpath('//bar/@id').value, 'attr'

  it 'should retrive multiple attributes', ->
    content = '<bars><bar id="attr1"/><bar id="attr2"/></bars>'
    attrs = parse(content).xpath('//bar/@id', true).map (r) ->
      r.value
    assert.sameMembers attrs, ['attr1', 'attr2']

  it 'should retrieve element text', ->
    content = '<foo><bar>text</bar></foo>'
    assert.equal parse(content).xpath('//bar/text()'), 'text'

  it 'should retrieve multiple element texts', ->
    content = '<bars><bar>text1</bar><bar>text2</bar></bars>'
    text = parse(content).xpath('//bar/text()', true).map (r) ->
      r.data
    assert.sameMembers text, ['text1', 'text2']