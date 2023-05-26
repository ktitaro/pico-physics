oval2={}
oval2.__index=oval2
setmetatable(oval2,shape2)

-- Properties:
oval2.r=0 -- radius
oval2.h=0 -- height

-- Creates an instance of oval2,
-- using a provided set of props.
function oval2:new(p)
  return shape2.new(self,p)
end

-- Approximates an oval2 to a
-- convex polygon and returns
-- an array of its vertexes.
function oval2:get_poly(pt)
  pt=(pt or self.p)
  local p={}
  local r=self.r
  local h=self.h
  local s=(r+h)/2
  local n=max(14,s)
  local a=1/n
  local mx=r-0.001
  local my=h-0.001
  for i=0,(n-1) do
    add(p,vec2:new(
      mid(-mx,r*cos(a*i),mx),
      mid(-my,h*sin(a*i),my)
    )+pt)
  end
  return p
end
