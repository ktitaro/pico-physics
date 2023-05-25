poly={}
poly.__index=poly

-- Properties:
poly.v={} -- vertexes

function poly:new(p)
  return setmetatable(p,self)
end

-- Since polygon doesn't need
-- any approximation, simply
-- returns the vertexes.
function poly:poly(dx,dy)
  dx=(dx or 0)
  dy=(dy or 0)
  local p={}
  for i in all(self.v) do
    local x=dx+i.x
    local y=dy+i.y
    add(p,vec2:new(x,y))
  end
  return p
end
