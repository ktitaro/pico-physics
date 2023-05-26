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

function poly2:get_poly(pt)
  pt=(pt or self.p)
  local p={}
  for v in all(self.v) do
    add(p,v+pt)
  end
  return p
end
