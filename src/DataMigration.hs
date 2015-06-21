{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -F -pgmF PVPreprocess #-}

module DataMigration where

import Data.SafeCopy
import Control.Applicative
import Data.Serialize.Put
import Data.Serialize.Get
import TypesV0
import TypesV1
import Types as CurrentTypes

instance SafeCopy TypesV0.Person where
  putCopy (TypesV0.Person a) = contain $ do safePut a;
  getCopy = contain $ TypesV0.Person <$> safeGet

instance SafeCopy TypesV1.Person where
  version = 1
  kind = extension
  putCopy (TypesV1.Person a b) = contain $ do safePut a; safePut b;
  getCopy = contain $ TypesV1.Person <$> safeGet <*> safeGet

instance SafeCopy CurrentTypes.Person where
  version = 2
  kind = extension
  putCopy (CurrentTypes.Person a b c) = contain $ do safePut a; safePut b; safePut c
  getCopy = contain $ CurrentTypes.Person <$> safeGet <*> safeGet <*> safeGet

instance Migrate TypesV1.Person where
  type MigrateFrom TypesV1.Person = TypesV0.Person
  migrate (TypesV0.Person a) = TypesV1.Person a 0

instance Migrate CurrentTypes.Person where
  type MigrateFrom CurrentTypes.Person = TypesV1.Person
  migrate (TypesV1.Person a b) = CurrentTypes.Person a b 0

