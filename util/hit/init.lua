
local hit = {
    map = {}
}

function hit:init(map)
    self.map = map
end

function hit:tile(x, y, layer)
    local tx, ty = self.map:convertScreenToWorld(x, y)
    tx = math.ceil(tx)
    ty = math.ceil(ty)
    local tile = self.map.layers[layer].data[ty][tx]
    if tile ~= nil then
        return tile
    else
        return false
    end
end

return hit
