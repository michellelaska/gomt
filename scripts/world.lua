--
--  world.lua
--
local entityData = require("scripts.entities")

-- game data

world = {
	points = 0
}

-- display 

local group = display.newGroup()
local screenWidth = display.contentWidth
local screenHeight = display.contentHeight

display.setDefault("anchorX", 0)
display.setDefault("anchorY", 0)


-- helper: create sprites

local function createEntitySprite(type, id, posX, posY)

  local animation = entityData[type][id].animation
  
  local sheet = graphics.newImageSheet(animation.sheet, { 
    width = animation.size[1], 
    height = animation.size[2], 
    numFrames = animation.frames
  })

  local sprite = display.newSprite(sheet, { 
    name = type, 
    start = 1, 
    count = animation.frames, 
    time = animation.time 
  })

  sprite.x, sprite.y = posX, posY

  return sprite

end

-- list of game objects

local animals = {}
local weapons = {}
local platforms = {}

-- create level

local function createBorders()
	
	local borders = {
		display.newRect(0, 0, screenWidth, 1),
		display.newRect(0, 0, 1, screenHeight),
		display.newRect(screenWidth, 0, 1, screenHeight)
	}

	physicsProperties = { 
		friction = 0.5, 
		bounce = 0.3, 
		filter = { categoryBits = 1, maskBits = 7 } 
	}

	for i = 1, #borders do
		borders[i]:setFillColor(100, 0, 0, 1)
		physics.addBody(borders[i], "static", physicsProperties)
	end

end


local function createPlatforms()

	for i = 1, 5 do
		local platform = display.newRect(10, 50 + i *100, screenWidth - 20, 30)
		platform.anchorX, platform.anchorY = 0, 0
		platform:setFillColor( .7 )
		platform.rotation = 4.6
		platforms[i] = platform

		physics.addBody(platform, "static", { density=1.0, friction=0.3, bounce=0.3 })
	end

end


local function createLevel()

	local background = display.newImageRect("images/background.png", screenWidth, screenHeight)
	background.anchorX, background.anchorY = 0, 0
	background.x, background.y = 0, 0
	group:insert(background)

	local bear = createEntitySprite("animals", "bear", screenWidth / 6, 100)
	bear:play()

	createBorders()
	createPlatforms()
end


-- create animal

local function createRandomAnimal()

	animal = {}
	animal.type = entityData.animalNames[math.random(1, table.getn(entityData.animalNames))]
	print(animal.type)

	local animalData = entityData.animals[animal.type]

	animal.properties = animalData.properties

	table.insert(animals, animal)

	animal.sprite = createEntitySprite("animals", animal.type, 300, 300)
	animal.sprite:play()

	physics.addBody(animal.sprite, { 
		density = animalData.physics.density, 
		friction = animalData.physics.friction, 
		bounce = animalData.physics.bounce
	})

	group:insert(animal.sprite)

end

-- create weapon

local function createWeapon(type)

	weapon = {}
	weapon.type = type

	local weaponData = entityData.weapons[weapon.type]
	weapon.properties = weaponData.properties

	table.insert(weapons, weapon)

	weapon.sprite = createEntitySprite("weapons", weapon.type, 160, 100)
	weapon.sprite:play()
	
	physics.addBody(weapon.sprite, { 
		density = weaponData.physics.density, 
		friction = weaponData.physics.friction, 
		bounce = weaponData.physics.bounce, 
		radius = weaponData.physics.radius 
	})

	group:insert(weapon.sprite)

end

-- world

function world:create()

	createLevel()
	--


	createRandomAnimal()
	createWeapon("acorn")

	
end

function world:update()

end

return world
