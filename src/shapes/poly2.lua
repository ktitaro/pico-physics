poly2={}
poly2.__index=poly2
setmetatable(poly2,shape2)

-- Properties:
poly2.v={} -- vertexes

-- Creates an instance of a poly2
-- using the provided set of props.
function poly2:new(p)
  return shape2.new(self,p)
end

-- Calculates the width and height
-- of an arbitrary convex polygon.
function poly2:get_size()
  local l=self.v[1].x
  local r=self.v[1].x
  local t=self.v[1].y
  local b=self.v[1].y
  for i=2,#self.v do
    local v=self.v[i]
    if (v.x<l) l=v.x
    if (v.x>r) r=v.x
    if (v.y<t) r=v.y
    if (v.y>b) b=v.y
  end
  local w=(r-l)
  local h=(b-t)
  return w,h
end

-- Since poly2 doesn't need any
-- approximation, it will return an
-- array of its vertexes while also
-- applying an offset to each of its
-- vertexes using a given vector `pt`.
function poly2:get_poly(pt)
  pt=(pt or vec2:new())
  local p={}
  for i=1,#self.v do
    add(p,self.v[i]+pt)
  end
  return p
end
