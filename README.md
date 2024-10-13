## SD Haunted House

## Preview
https://youtu.be/BFolGfR5YoQ

## Discord (Join for support)
https://discord.gg/GkcsMrDavc

## Description
SD-HauntedHouse is a thrilling Halloween mini-game designed to immerse players in a spooky, fun-filled adventure. This haunted house experience offers fully customizable features, including eerie NPCs (Peds), randomized spawn locations, and customisable rewards to keep the excitement fresh and engaging every time.

Perfect for the Halloween season, players will love the creepy atmosphere and surprises awaiting them as they explore the haunted house.

Get ready for some terrifying fun!

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

## Step 5 - Customising Rewards
Go to client/client.lua line 113, Change args = { item = "weapon_axe" } to your items or events.

## MLO in the video

We are using "GTA V MLO Interior Horror School by UncleJust"
https://www.youtube.com/watch?v=d-9QKVgtOyM
