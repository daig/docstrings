{-# language TemplateHaskell #-}
{-# language QuasiQuotes #-}
module Language.Docstring.Docs (module X) where
import Language.Docstring as X
import Language.Help as X

docstring 'docstring
  [str|Add documentation string for given `Name`, to be retrieved by `Language.Help.help`.
      |You may want to use the `Text.Heredoc.str` quasiquoter for convinient multiline documentation.
      |(See definition for `docstring`)
      |
      |`docstring` adds documentation to a magic global scope as a Template Haskell side effect
      |and so documentation for `MyModule` should probably be added only in a seperate `MyModule.Doc` module
      |to avoid polluting application code|]
                         
docstring 'help
  [str|Retrieve documentation for a value/function identifier `'myIdentifier`
      |or a type identifier `''MyIdentifier`.
      |
      |`help` will find documentation from any use of `docstring` in previously imported modules.
      |Documentation for a module `MyModule` is conventionally found in an associated `MyModule.Docs`|]
