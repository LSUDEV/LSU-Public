warn()
local Library = require(game:GetService("ReplicatedStorage").Framework.Library)
local PetList = {}
for i,v in pairs(Library.Directory.Pets ) do
    PetList[i] = v.name
end
local MyPets = Library.Save.Get().Pets 
local TempTable = {}

for i,v in pairs(MyPets) do
if v.g then
    local TempString = '*Gold*: '..PetList[v.id]
    if TempTable[TempString] then
        table.insert(TempTable[TempString], v.uid)
    else
        TempTable[TempString] = {}
        table.insert(TempTable[TempString], v.uid)
    end
elseif v.r then
    local TempString = '*Rainbow*: '..PetList[v.id]
    if TempTable[TempString] then
        table.insert(TempTable[TempString], v.uid)
    else
        TempTable[TempString] = {}
        table.insert(TempTable[TempString], v.uid)
    end
else
    local TempString = '*Normal*: '..PetList[v.id]
    if TempTable[TempString] then
        table.insert(TempTable[TempString], v.uid)
    else
        TempTable[TempString] = {}
        table.insert(TempTable[TempString], v.uid)
    end
end
end
for i,v in pairs(TempTable) do
    print(i, #v)
end
