## SD Haunted House

## Installation

## Step 1 - Adding Ghoul Tokens.
Go to your qb-core/shared/items.lua and the following item :
```lua
    ["haunted_token"]   			= {["name"] = "haunted_token", 				["label"] = "Ghoul Token", 		["weight"] = 1000, 		["type"] = "item", 		["image"] = "haunted_token.png", 				["unique"] = false,   	["useable"] = true,    ["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "A token gifted by a Ghoul!"},
```

## Step 2 - Adding images.
Go to your inventory images folder and copy haunted_token.png and paste it in there.

## Step 3 - Configure your peds.
Go to client/client.lua line 3 and use the peds you want.

## Step 4 - If you want to use another MLO.
Go to client/client.lua 
line 3 - swap the Ghoul spawns to your spawns.
line 107 - swap traderLocation to your spawns.
line 193 & 203 - Change vector 2 coords to your area (/pzcreate poly)
line 264 - change blip vector 3

## MLO in the video

We are using "GTA V MLO Interior Horror School by UncleJust"
https://www.youtube.com/watch?v=d-9QKVgtOyM