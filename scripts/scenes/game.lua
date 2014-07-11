--
-- game.lua
--

local composer = require("composer")
local scene = composer.newScene()

local physics = require("physics")

local world = require("scripts.world")

function scene:create(event)
	physics.start() 
	physics.setScale(60)
	physics.setGravity(0, 9.81)
	physics.pause()
	
	world:create()
end

function scene:show(event)
	local sceneGroup = self.view

	if event.phase == "will" then
	elseif event.phase == "did" then
		physics.start()
	end
end

function scene:hide(event)
	local sceneGroup = self.view
	
	if event.phase == "will" then
		physics.stop()
	elseif event.phase == "did" then
	end	
	
end

function scene:destroy(event)
	local sceneGroup = self.view
	
	package.loaded[physics] = nil
	physics = nil
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene