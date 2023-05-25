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

function area:collides_at(x,y)

  -- local w,h=self.w,self.h
  -- local b1={x=x,y=y,w=w,h=h}
  -- for b2 in all(_world.o) do
  --   if (b2~=self) then
  --     local k=aabb:overlaps(b1,b2)
  --     local m=(self.cm&b2.cl~=0)
  --     if (k and m) return b2.cl
  --   end
  -- end
end
