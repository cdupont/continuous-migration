{-# LANGUAGE TypeFamilies #-}

module DataMigration where

import Data.SafeCopy
import Control.Applicative
import Data.Serialize.Put
import Data.Serialize.Get
import Types

instance SafeCopy MyType where
  putCopy (MyType a) = contain $ do safePut a;
  getCopy = contain $ MyType <$> safeGet

