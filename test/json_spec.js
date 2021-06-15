const { assert } = require('chai');
const parse = require('../lib/json');

describe('JSON', () => it('should retrieve object', function () {
  const content = '{"foo":"bar"}';
  assert.equal(parse(content).foo, 'bar');
}));
