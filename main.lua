-- Tutorial Framework
-- By Germanunkol, April 2014
-- Code release under the "Do What The Fuck You Want To Public License" (see http://www.wtfpl.net for details )

-- Image files are from here (Skeleton):
-- http://opengameart.org/content/lpc-skeleton
-- And here (Spear man):
-- http://opengameart.org/content/spear-walk
-- Both are released under Creative Common Licenses, make sure to visit the Links for more details before using the images in your own projects.
-- Thanks to the authors!

Character = require("character")
Shaders = require("shaders")

local chars = {}

function love.load()

	-- initialize character class:
	Character:init()
	
	-- create and remember two characters - a skeleton and a 
	chars[1] = Character:new("skeleton")
	chars[2] = Character:new("spearguy")

	chars[1]:setPosition( love.graphics.getWidth()/3-64, love.graphics.getHeight()/2-64 )
	chars[2]:setPosition( 2*love.graphics.getWidth()/3-64, love.graphics.getHeight()/2-64 )

	love.graphics.setFont( love.graphics.newFont(14) )

	Shaders:addShader( "outline", "o" )
	Shaders:addShader( "gaussian", "g" )
end

function love.update( dt )
	chars[1]:update( dt )
	chars[2]:update( dt )
end

function love.draw()
	chars[1]:draw()
	chars[2]:draw()
	Shaders:draw()
end

function love.keypressed( key )
	Shaders:keypressed( key )
end
