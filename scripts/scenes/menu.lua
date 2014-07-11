--
-- start.lua
--


local composer = require("composer")
local scene = composer.newScene()

local widget = require("widget")

local playButton


local function onPlayButtonRelease()

	composer.gotoScene("scripts.scenes.level", "fade", 500)
	return true

end


function scene:create(event)

	local sceneGroup = self.view

	local background = display.newImageRect("images/menu.png", display.contentWidth, display.contentHeight)
	background.anchorX, background.anchorY = 0, 0
	background.x, background.y = 0, 0
	
	playButton = widget.newButton {
		label = "Press To Play",
		labelColor = { default = { 255 }, over = { 128 } },
		-- default = "images/ui/button.png",
		-- over = "images/ui/button-over.png",
		width = 154, 
		height = 40,
		onRelease = onPlayButtonRelease
	}

	playButton.x = display.contentWidth * 0.5
	playButton.y = display.contentHeight - 125
	
	sceneGroup:insert(background)
	sceneGroup:insert(playButton)

end


function scene:show(event)

	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
	elseif phase == "did" then
	end	

end


function scene:hide(event)

	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
	elseif phase == "did" then
	end	

end


function scene:destroy(event)

	local sceneGroup = self.view
	
	if playButton then
		playButton:removeSelf()
		playButton = nil
	end

end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene