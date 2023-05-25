area={}
area.__index=area

-- Properties
area.s=nil -- shape of an area
area.x=0 -- position on x axis
area.y=0 -- position on y axis
area.l=0 -- collision layer
area.m=0 -- collision mask

function area:new(p)
  if (p.l) p.l=tobin(p.l)
  if (p.m) p.m=tobin(p.m)
  return setmetatable(p,self)
end

function area:collide_tile_at()
end

function area:collide_area_at()
end
