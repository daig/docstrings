module Help.Docstring.Internal (docstrings, module X) where
import GHC.IO as X (unsafePerformIO)
import GHC.Conc (pseq)
import Data.Map as M
import Control.Concurrent.MVar as X (MVar,newMVar,modifyMVar,readMVar)
import Language.Haskell.TH.Syntax as X (Name,Q,Dec)


docstrings :: MVar (Map Name String)
{-# noinline docstrings #-}
docstrings = m `pseq` unsafePerformIO (newMVar m) where m = M.empty
