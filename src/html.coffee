cheerio = require 'cheerio'

parse = (content) ->
  queryable = cheerio.load(content)

  queryable.toString = ->
    content

  queryable


module.exports = parse