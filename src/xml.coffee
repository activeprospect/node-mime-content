xpath = require 'xpath'
xmldom = require 'xmldom'

parse = (content) ->
  doc = new xmldom.DOMParser().parseFromString(content)
  doc.xpath = (selector, multi) ->
    multi ?= false
    xpath.select(selector, doc, !multi)
  doc

module.exports = parse