cheerio = require 'cheerio'

parse = (content) ->
  cheerio.load(content)

module.exports = parse