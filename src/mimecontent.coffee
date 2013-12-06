xml = require './xml'
json = require './json'
urlEncoded = require './urlencoded'
html = require './html'

mime = (contentType) ->
  contentType ?= ''
  contentType.toLowerCase().replace(/^\s+|\s+$/g, '').split(';')[0];


parse = (content, contentType) ->
  mimeType = mime(contentType)

  parsed =
    if (mimeType == 'application/xml' || mimeType == 'text/xml')
      xml(content)

    else if (mimeType == 'application/json')
      json(content)

    else if (mimeType == 'application/x-www-form-urlencoded')
      urlEncoded(content)

    else if (mimeType == 'text/html')
      html(content)

    else
      content

  parsed

module.exports = parse
