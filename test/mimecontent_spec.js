const { assert } = require('chai');
const content = require('../lib/mimecontent');

describe('MIME Content', function () {
  it('should parse JSON', function () {
    const parsed = content('{"foo":"bar"}', 'application/json');
    assert.equal(parsed.foo, 'bar');
  });

  it('should parse application XML', function () {
    const parsed = content('<foo>bar</foo>', 'application/xml');
    assert.equal(parsed.xpath('//foo/text()').data, 'bar');
  });

  it('should parse text XML', function () {
    const parsed = content('<foo>bar</foo>', 'text/xml');
    assert.equal(parsed.xpath('//foo/text()').data, 'bar');
  });

  it('should parse HTML', function () {
    const parsed = content('<html><body><h1>Header!</h1></body></html>', 'text/html');
    assert.equal(parsed('h1').text(), 'Header!');
  });

  it('should parse URL encoded', function () {
    const parsed = content('foo=bar', 'application/x-www-form-urlencoded');
    assert.equal(parsed.foo, 'bar');
  });

  it('should not parse in the absence of a content type', function () {
    const value = content('foo=bar');
    assert.equal(value, 'foo=bar');
  });

  it('should not parse on unknown content type', function () {
    const value = content('foo=bar', 'text/donkies');
    assert.equal(value, 'foo=bar');
  });
});
