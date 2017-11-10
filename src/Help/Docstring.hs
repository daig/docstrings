module Help.Docstring (docstring, module X ) where
import Help.Docstring.Internal
import Data.Map as M
import Language.Haskell.TH.Syntax as X (Name,Q,Dec)
import Text.Heredoc as X (str)

docstring :: Name -> String -> Q [Dec]
docstring n s = unsafePerformIO (modifyMVar docstrings (\m -> return (M.insert n s m,()))) `seq` return []
