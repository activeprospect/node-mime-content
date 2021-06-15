const { assert } = require('chai');
const parse = require('../lib/urlencoded');

describe('URL encoded', function () {
  it('should retrieve object', function () {
    const content = 'foo=bar&baz=bip';
    const parsed = parse(content);
    assert.equal(parsed.foo, 'bar');
    assert.equal(parsed.baz, 'bip');
  });

  it('should parse multiple keys of the same name into an array', function () {
    const content = 'foo=bar&foo=baz';
    assert.sameMembers(parse(content).foo, ['bar', 'baz']);
  });
});
