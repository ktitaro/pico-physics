circ={}
circ.__index=circ

-- Properties:
circ.r=0 -- radius

function circ:new(p)
  return setmetatable(p,self)
end

-- Approximates circle to a
-- convex polygon and applies
-- an offset of `dx`, `dy` to
-- the each vertex.
function circ:poly(dx,dy)
  dx=(dx or 0)
  dy=(dy or 0)
  local p={}
  local r=self.r
  local s=flr(6.28*r)
  local n=mid(6,s,12)
  for i=1,n do
    local d=1/n*i
    local x=dx+(r*cos(d))
    local y=dy+(r*sin(d))
    add(p,vec2:new(x,y))
  end
  return p
end
