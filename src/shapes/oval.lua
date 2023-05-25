oval={}
oval.__index=oval

-- Properties:
oval.r=0 -- radius
oval.h=0 -- height

function oval:new(p)
  return setmetatable(p,self)
end

-- Approximates oval to a
-- convex polygon. The number
-- of edges grows with radius.
function oval:poly(dx,dy)
  dx=(dx or 0)
  dy=(dy or 0)
  local p={}
  local r=self.r
  local h=self.h
  local s=(r+h)/2
  local n=mid(8,s,32)
  for i=1,n do
    local d=1/n*i
    local x=dx+(r*cos(d))
    local y=dy+(h*sin(d))
    add(p,vec2:new(x,y))
  end
  return p
end
