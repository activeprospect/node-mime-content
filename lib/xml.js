const xpath = require('xpath');
const xmldom = require('@xmldom/xmldom');
const xml2js = require('xml2js');

module.exports = function (content) {
  const doc = new xmldom.DOMParser().parseFromString(content);

  doc.xpath = function (selector, multi = false) {
    return xpath.select(selector, doc, !multi);
  };

  doc.toObject = function (options = {}) {
    options.async = false;
    const parser = new xml2js.Parser(options);
    let rtn = null;
    parser.parseString(content, function (err, result) {
      if (err) { throw err; }
      rtn = result;
    });
    return rtn;
  };

  return doc;
};
