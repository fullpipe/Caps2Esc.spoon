local obj={}
obj.__index = obj

-- Metadata
obj.name = 'Caps2Esc'
obj.version = '0.1'
obj.author = 'Eugene Bravov <eugene.bravov@gmail.com>'
obj.homepage = 'https://github.com/fullpipe/Caps2Esc.spoon'
obj.license = 'MIT - https://opensource.org/licenses/MIT'

function obj:init()
    self.onlyCtrlPressed = false
    self.ctrlPressed = false
    self.log = hs.logger.new('Caps2Esc','debug')
    self.log.i('Initializing')

    self.flagHandler = hs.eventtap.new(
        {hs.eventtap.event.types.flagsChanged},
        function(event)
            if event:getKeyCode() ~= 62 and ctrlPressed then
                onlyCtrlPressed = false
                return
            end

            if event:getKeyCode() == 62 then
                ctrlPressed = not ctrlPressed
            end

            if ctrlPressed and event:getFlags():containExactly({'ctrl'}) then
                onlyCtrlPressed = true
            end

            if event:getKeyCode() == 62 and not ctrlPressed and onlyCtrlPressed then
                hs.eventtap.event.newKeyEvent('escape', true):post()
            end

            if not ctrlPressed then
                onlyCtrlPressed = false
            end
        end
    )

    self.keyDownHandler = hs.eventtap.new(
        {hs.eventtap.event.types.keyDown},
        function(event)
            if ctrlPressed then
                onlyCtrlPressed = false
            end
        end
    )
end

--- Caps2Esc:start()
--- Method
--- Starts handling `caps lock` as escape
function obj:start()
    self.flagHandler:start()
    self.keyDownHandler:start()
end

--- Caps2Esc:stop()
--- Method
--- Stops handling `caps lock` as escape
function obj:stop()
    self.flagHandler:stop()
    self.keyDownHandler:stop()


    self.onlyCtrlPressed = false
    self.ctrlPressed = false
end

return obj
