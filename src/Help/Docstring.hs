{-|
Module      : Help.Docstring
Description : Define docstrings
Copyright   : Dai 2017
License     : MIT
Maintainer  : dailectic@gmail.com
Stability   : experimental
Portability : POSIX
-}
module Help.Docstring (docstring, module X ) where
import Help.Docstring.Internal
import Data.Map as M
import Language.Haskell.TH.Syntax as X (Name,Q,Dec)
import Text.Heredoc as X (str)

-- | Add documentation string for given `Name`, to be retrieved by `help`.
-- You may want to use the `Text.Heredoc.str` quasiquoter for convinient multiline documentation.
-- (See definition for `docstring`)
--
-- `docstring` adds documentation to a magic global scope as a Template Haskell side effect
-- and so documentation for `MyModule` should probably be added only in a seperate `MyModule.Doc` module
-- to avoid polluting application code
docstring :: Name -> String -> Q [Dec]
docstring n s = unsafePerformIO (modifyMVar docstrings (\m -> return (M.insert n s m,()))) `seq` return []
