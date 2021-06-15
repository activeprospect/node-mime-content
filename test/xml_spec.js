const { assert } = require('chai');
const parse = require('../lib/xml');

describe('XML', function () {
  it('should retrieve attribute with xpath', function () {
    const content = '<foo><bar id="attr"></bar></foo>';
    assert.equal(parse(content).xpath('//bar/@id').value, 'attr');
  });

  it('should retrive multiple attributes with xpath', function () {
    const content = '<bars><bar id="attr1"/><bar id="attr2"/></bars>';
    const attrs = parse(content).xpath('//bar/@id', true).map(r => r.value);
    assert.sameMembers(attrs, ['attr1', 'attr2']);
  });

  it('should retrieve element text with xpath', function () {
    const content = '<foo><bar>text</bar></foo>';
    assert.equal(parse(content).xpath('//bar/text()'), 'text');
  });

  it('should retrieve multiple element texts with xpath', function () {
    const content = '<bars><bar>text1</bar><bar>text2</bar></bars>';
    const text = parse(content).xpath('//bar/text()', true).map(r => r.data);
    assert.sameMembers(text, ['text1', 'text2']);
  });

  it('should be coercable to an object', function () {
    const content = '<people><person id="123"><name>Bob Smith</name></person><person id="456"><name>Jimmy Dean</name></person></people>';
    const expected = {
      person: [
        { id: '123', name: 'Bob Smith' },
        { id: '456', name: 'Jimmy Dean' }
      ]
    };
    assert.deepEqual(expected, parse(content).toObject({ explicitArray: false, explicitRoot: false, mergeAttrs: true }));
  });
});
