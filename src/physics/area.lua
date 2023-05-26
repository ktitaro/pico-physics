area={}
area.__index=area

-- Properties:
area.cm=0 -- collision mask
area.cl=0 -- collision layer

-- Creates an instance of an area,
-- using a provided set of props.
function area:new(shape,p)
  if (p.cl) p.cl=tobin(p.cl)
  if (p.cm) p.cm=tobin(p.cm)
  setmetatable(shape,self)
  return shape:new(p)
end

function area:collides_at(reg,pt)
  local p1=self:get_poly(pt)
  for v in all(reg) do
    if (v~=self) then
      local p2=v:get_poly()
      local k=sat2:check(p1,p2)
      local m=self.cm&v.cl~=0
      if (k and m) return v.cl
    end
  end
end
