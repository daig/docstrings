# docstrings
  This package provides <https://en.wikipedia.org/wiki/Docstring docstring> funcionality similar to Python or Lisp.
  Docstrings are simply strings bound to identifier names.
  To get access to a name one must enable @-XTemplateHaskell@ and use
  prime notation like @'myValIdentifier@ and @''MyTypeIdentifier@.
  Access Docstrings in the repl via @help 'myIdentifier@,
  and introduce Docstrings via @docstring 'myIdentifier "some documentation"@ in a module.
