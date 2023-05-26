poly2={}
poly2.__index=poly2
setmetatable(poly2,shape2)

-- Properties:
poly2.v={} -- vertexes

-- Creates an instance of poly2,
-- using a provided set of props.
function poly2:new(p)
  return shape2.new(self,p)
end

-- Since poly2 doesn't need any
-- approximation, it will only
-- apply an offset its vertexes.
function poly2:get_poly(pt)
  pt=(pt or self.p)
  local p={}
  for i=1,#self.v do
    add(p,self.v[i]+pt)
  end
  return p
end
