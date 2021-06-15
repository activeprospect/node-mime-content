const { assert } = require('chai');
const parse = require('../lib/html');

describe('HTML', function () {
  it('should retrieve element by css selector', function () {
    const content = '<html><body><h1 class="klass">foo</h1></foo>';
    assert.equal(parse(content)('h1.klass').text(), 'foo');
  });

  it('should return null for invalid HTML', function () {
    assert.isNull(parse("{'foo':'bar'}"));
  });
});
