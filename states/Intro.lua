local sti = require('lib.sti')
local Intro = {}

function Intro:new(mappath)
  local new = {}
  setmetatable(new, self)
  self.__index = self

  new.mappath = mappath
  return new
end

function Intro:init()
    self.map = sti.new(self.mappath)
    local world = tiny.world(
        require('systems.MapUpdate'):new(self.map),
        require('systems.MapDraw'):new(self.map),
        require('systems.SpriteDraw')
    )

    for k, obj in pairs(self.map.objects) do
        if obj.name == 'Player' then
            print('player', obj)
            world:addEntity(require('entities.Player'):new(obj, 'assets/img/char.png'))
            break
        end
    end

    _G.world = world
end

return Intro
