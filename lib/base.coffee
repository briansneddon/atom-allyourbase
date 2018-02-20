SimpleBase = require 'simple-base'

module.exports =

  activate: (state) ->
    atom.commands.add 'atom-workspace',
      'base64:encode': => @b64_encode()
      'base64:decode': => @b64_decode()
      'base58:encode': => @b58_encode()
      'base58:decode': => @b58_decode()

  b64_encode: ->
    editor = atom.workspace.getActiveTextEditor()
    selections = editor.getSelections()
    for selection in selections
      selection.insertText(
        new Buffer(selection.getText()).toString("base64"),
        { "select": true}
      )

  b64_decode: ->
    editor = atom.workspace.getActiveTextEditor()
    selections = editor.getSelections()
    for selection in selections
      selection.insertText(
        new Buffer(selection.getText(), "base64").toString("utf8"),
        { "select": true }
      )
  b58_encode: ->
    editor = atom.workspace.getActiveTextEditor()
    selections = editor.getSelections()
    for selection in selections
      selection.insertText(
        SimpleBase.encode(selection.getText(), 58),
        { "select": true}
      )

  b58_decode: ->
    editor = atom.workspace.getActiveTextEditor()
    selections = editor.getSelections()
    for selection in selections
      selection.insertText(
        SimpleBase.decode(selection.getText(), 58),
        { "select": true}
      )
