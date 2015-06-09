git tag -d V0 V1 V2

echo "module Types where \ndata MyType = MyType Int deriving (Show)\n" > Types.hs

git add src/Types.hs; git commit -n "V0"; git tag V0

echo "module Types where \ndata MyType = MyType Int Int deriving (Show)\n" > Types.hs

git add src/Types.hs; git commit -n "V1"; git tag V1

echo "module Types where \ndata MyType = MyType Int Int Int deriving (Show)\n" > Types.hs

git add src/Types.hs; git commit -n "V2"; git tag V2

