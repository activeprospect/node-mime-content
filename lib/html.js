const cheerio = require('cheerio');

module.exports = function (content) {
  const html = cheerio.parseHTML(content);
  return ((html.length > 0) && (html[0].type !== 'text')) ? cheerio.load(content) : null;
};
