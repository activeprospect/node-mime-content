const { assert } = require('chai');
const parse = require('../lib/json');

describe('JSON', function () {
  it('should retrieve object', function () {
    const content = '{"foo":"bar"}';
    assert.equal(parse(content).foo, 'bar');
  });
  it('should throw an error', function () {
    try {
      parse('boom!');
    } catch(err){
      assert.instanceOf(err, Error);
      assert.equal(err.message, 'Unexpected token b in JSON at position 0');
    }
  });
});


