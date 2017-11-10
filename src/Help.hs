{-# language TemplateHaskell #-}
{-# language QuasiQuotes #-}
module Help (help, docstring) where
import Help.Docstring
import Help.Docstring.Internal
import Data.Map as M

help :: Name -> IO ()
help n = do
  m <- readMVar docstrings
  putStrLn $ case M.lookup n m of
    Nothing -> "no documentation for " ++ show n
    Just s -> "=== " ++ show n ++ " ===\n" ++ s ++ "\n======"

docstring 'docstring
  [str|Add documentation string for given `Name`, to be retrieved by `help`.
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
