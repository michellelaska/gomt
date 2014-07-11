--
--  game.lua
--

local widget = require("widget")

local entityData = require("scripts.data.entities")

-- game data

game = {
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


-- create level

local function createBorders()
	
	local borderRects = {
		{ -1, 0, screenWidth, 1 },
		{ 0, -1, 1, screenHeight },
		{ screenWidth, 0, 1, screenHeight }
	}

	physicsProperties = { 
		friction = 0.5, 
		bounce = 0.3, 
		filter = { categoryBits = 1, maskBits = 7 } 
	}

	for i = 1, table.getn(borderRects) do
		local borderRect = borderRects[i]
		local border = display.newRect(borderRect[1], borderRect[2], borderRect[3], borderRect[4])
		border:setFillColor(0, 0, 0, 0)
		physics.addBody(border, "static", physicsProperties)
	end

end


local function createPlatforms()

	platformData = entityData.platforms

	physicsProperties = { 
		density = 1,
		friction = 0.5, 
		bounce = 0.4
	}

	for i = 1, table.getn(platformData) do
		local platform = display.newImage("images/platform.png", platformData[i].x, platformData[i].y)
		platform:rotate(platformData[i].rotation)
		physics.addBody(platform, "static", physicsProperties)
	end

end


local function createLevel()

	local background = display.newImageRect("images/background.png", screenWidth, screenHeight)
	background.anchorX, background.anchorY = 0, 0
	background.x, background.y = 0, 0
	group:insert(background)

	local bear = createEntitySprite("player", "bear", screenWidth / 6, 90)
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
	animal.sprite = createEntitySprite("animals", animal.type, 210, 700)
	animal.sprite.xScale = -1
	
	table.insert(animals, animal)
	physics.addBody(animal.sprite, animalData.physics)
	group:insert(animal.sprite)

	animal.sprite:play()
	animal.sprite:applyForce(0, 1.5, 0, 0)

end

-- create weapon

local function createWeapon(type)

	weapon = {}
	weapon.type = type

	local weaponData = entityData.weapons[weapon.type]
	weapon.properties = weaponData.properties
	weapon.sprite = createEntitySprite("weapons", weapon.type, 220, 100)
	
	table.insert(weapons, weapon)
	physics.addBody(weapon.sprite, weaponData.physics)
	group:insert(weapon.sprite)

	weapon.sprite:play()

end


local function handleCreateWeaponButton(event)

	if event.phase == "ended" then
		weapon = event.target.weapon
		createWeapon(weapon)
	end

end


-- create ui

local function createWeaponButton(weapon)

	local button = widget.newButton({
		label = weapon,
		labelColor = { default = { 255 }, over = { 128 } },
		fontSize = 32,
		-- default = "images/ui/button.png",
		-- over = "images/ui/button-over.png",
		width = 150, 
		height = 40,
		onEvent = handleCreateWeaponButton
	})

	button.weapon = weapon

	return button

end


local function createUI()

	for i = 1, table.getn(entityData.weaponNames) do
		weapon = entityData.weaponNames[i]
		local button = createWeaponButton(weapon)
		button.x, button.y = screenWidth / 4 * (i - 1), screenHeight - 100
		group:insert(button)
	end

	local score = display.newText({
		text = "0",
		-- font = native.systemFontBold, 
		fontSize = 64
	})

	score.x, score.y = screenWidth - 80, 50
	group:insert(score)
end



-- game

function game:create()

	createLevel()
	createUI()

	createRandomAnimal()
	createWeapon("acorn")

	
end

function game:update()

end

return game
