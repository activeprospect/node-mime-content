const xml = require('./xml');
const json = require('./json');
const urlEncoded = require('./urlencoded');
const html = require('./html');

const trimRegex = /^\s+|\s+$/g; // matches one or more spaces at start or end of string

const mime = function (contentType = '') {
  return (contentType.toLowerCase().replace(trimRegex, '').split(';')[0]);
};

module.exports = function (content, contentType) {
  const mimeType = mime(contentType);

  let parsed = content;

  if (mimeType === 'application/xml' || mimeType === 'text/xml') {
    parsed = xml(content);
  } else if (mimeType === 'application/json') {
    parsed = json(content);
  } else if (mimeType === 'application/x-www-form-urlencoded') {
    parsed = urlEncoded(content);
  } else if (mimeType === 'text/html') {
    parsed = html(content);
  }

  return (parsed);
};
