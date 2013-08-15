qs = require 'querystring'

parse = (content) ->

  queryable = qs.parse(content)

  queryable.toString = ->
    content

  queryable

module.exports = parse
