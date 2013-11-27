assert = require('chai').assert
parse = require('../src/xml')

describe 'XML', ->

  it 'should be coercable to a string', ->
    content = '<foo><bar/></foo>'
    assert.equal parse(content).toString(), content

    content = '<bars><bar>text1</bar><bar>text2</bar></bars>'
    assert.equal parse(content).toString(), content

  it 'should retrieve attribute with xpath', ->
    content = '<foo><bar id="attr"></bar></foo>'
    assert.equal parse(content).xpath('//bar/@id').value, 'attr'

  it 'should retrive multiple attributes with xpath', ->
    content = '<bars><bar id="attr1"/><bar id="attr2"/></bars>'
    attrs = parse(content).xpath('//bar/@id', true).map (r) ->
      r.value
    assert.sameMembers attrs, ['attr1', 'attr2']

  it 'should retrieve element text with xpath', ->
    content = '<foo><bar>text</bar></foo>'
    assert.equal parse(content).xpath('//bar/text()'), 'text'

  it 'should retrieve multiple element texts with xpath', ->
    content = '<bars><bar>text1</bar><bar>text2</bar></bars>'
    text = parse(content).xpath('//bar/text()', true).map (r) ->
      r.data
    assert.sameMembers text, ['text1', 'text2']

  it 'should be coercable to an object', ->
    content = '<people><person id="123"><name>Bob Smith</name></person><person id="456"><name>Jimmy Dean</name></person></people>'
    expected =
      person: [
        { id: '123', name: 'Bob Smith' },
        { id: '456', name: 'Jimmy Dean' }
      ]
    assert.deepEqual expected, parse(content).toObject(explicitArray: false, explicitRoot: false, mergeAttrs: true)