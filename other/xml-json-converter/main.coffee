# library with converter functionality

fs = require "fs"
get_stdin = require "get-stdin"
program = require "commander"
xml2js = require "xml2js"

xml2json = (xml, c) ->
  # string -> string
  xml2js.parseString xml, (err, result) ->
    c JSON.stringify(result, null, 2)

json2xml = (json, c) ->
  # string -> string
  builder = new xml2js.Builder
  c builder.buildObject JSON.parse json

convert = (converter) ->
  input_file = null
  output_file = null
  program
    .arguments("[input_file] [output_file]")
    .description("if any of input_file or output_file is not given use standard input or output respectively.")
    .action (a, b) ->
      input_file = a
      output_file = b
    .parse process.argv
  if input_file
    input = fs.createReadStream input_file
  else input = process.stdin
  if output_file
    input = fs.createWriteStream output_file
  else output = process.stdout
  input_string = ""
  input.on "data", (data) -> input_string += data.toString()
  input.on "end", ->
    converter input_string, (result) ->
      output.write result
      if input_file then input.close()
      if output_file then output.close()

module.exports = {
  convert
  json2xml
  xml2json
}
