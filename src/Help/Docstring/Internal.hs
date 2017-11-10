{-|
Module      : Help.Docstring.Internal
Description : Define docstrings
Copyright   : Dai 2017
License     : MIT
Maintainer  : dailectic@gmail.com
Stability   : experimental
Portability : POSIX
-}
module Help.Docstring.Internal (docstrings, module X) where
import GHC.IO as X (unsafePerformIO)
import GHC.Conc (pseq)
import Data.Map as M
import Control.Concurrent.MVar as X (MVar,newMVar,modifyMVar,readMVar)
import Language.Haskell.TH.Syntax as X (Name,Q,Dec)


-- | Global list of docstrings. Should not be accessed directly and only be manipulated by @docstring@ and @help@
docstrings :: MVar (Map Name String)
{-# noinline docstrings #-}
docstrings = m `pseq` unsafePerformIO (newMVar m) where m = M.empty
