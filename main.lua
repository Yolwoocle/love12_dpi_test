local image
local canvas

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")

	image = love.graphics.newImage("bands.png")
	canvas = love.graphics.newCanvas(480, 270, {dpiscale = 1})

	love.window.setMode(1440*1.5, 889*1.5, {
		resizable = true,
	})
end

function love.update(dt)
end

function love.draw()
	-- Scaled
	love.graphics.setCanvas(canvas)
	local w, h = love.graphics.getDimensions()
	love.graphics.draw(image, 0, 0)
	love.graphics.setCanvas()
	local canvasScale = math.min(w / image:getWidth(), h / image:getHeight())
	love.graphics.draw(canvas, 0, 0, 0, canvasScale, canvasScale)

	-- Unscaled
	love.graphics.draw(image, 0, 0)

	-- Debug info 
	local strings = {
		"Window dimensions: "..tostring(w)..", "..tostring(h),
		"Image dimensions: "..tostring(image:getWidth())..", "..tostring(image:getHeight()),
		"Canvas scale: "..tostring(canvasScale),
	}
	love.graphics.setColor({0, 0, 0, 0.5})
	love.graphics.rectangle("fill", 0, h-(#strings*16), 500, #strings * 16)	
	love.graphics.setColor({1, 1, 1, 1})
	for i=1, #strings do
		love.graphics.print(strings[i], 0, h-i*16)
	end
end