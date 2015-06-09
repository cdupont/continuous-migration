git tag -d V0 V1 V2

myFile=src/Types.hs

printf "module Types where \ndata MyType = MyType Int deriving (Show)\n" >> $myFile

git add $myFile; git commit -m "V0"; git tag V0

printf "module Types where \ndata MyType = MyType Int Int deriving (Show)\n" > $myFile

git add $myFile; git commit -m "V1"; git tag V1

printf "module Types where \ndata MyType = MyType Int Int Int deriving (Show)\n" > $myFile

git add $myFile; git commit -m "V2"; git tag V2

