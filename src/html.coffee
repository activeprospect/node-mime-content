cheerio = require 'cheerio'

parse = (content) ->
  html = cheerio.parseHTML(content)
  if html.length > 0 and html[0].type != 'text'
    cheerio.load(content)
  else
    null

module.exports = parse
