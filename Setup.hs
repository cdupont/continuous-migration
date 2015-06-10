
import Distribution.Simple
import System.Process
import Data.List
import Control.Concurrent
import System.IO
import PreviousVersion as PV

modName = "Types"
versions = ["V0", "V1", "V2"]


main = do
   --This function will retrieve V0 and V1 of the file Types.hs and put them in dist/build/autogen
   PV.retrieveFileVersions versions modName PV.defaultConf
   defaultMainWithHooks simpleUserHooks

