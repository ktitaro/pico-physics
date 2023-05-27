area={}
area.__index=area
setmetatable(area,shape2)

-- Properties:
area.cm=0 -- collision mask
area.cl=0 -- collision layer
area.p=vec2:new() -- position (x,y)

-- Creates an instance of an area
-- using the provided set of props.
function area:new(shape,p)
  if (p.cl) p.cl=tobin(p.cl)
  if (p.cm) p.cm=tobin(p.cm)
  setmetatable(shape,self)
  return shape:new(p)
end

-- Checks if area would collide with
-- a map tile at a given point `pt`.
function area:hits_tile_at(pt)
  local x,y=(pt.x/8),(pt.y/8)
  local cl=1<<fget(mget(x,y))
  if (self.cm&cl~=0) return cl
end

-- Checks if area would collide with any
-- other area at the provided point `pt`.
-- It requires a list of all the defined
-- game objects to be provided as `reg`.
function area:hits_area_at(reg,pt)
  local p1=self:get_poly(pt)
  for _,v in ipairs(reg) do
    if (v~=self) then
      local p2=v:get_poly(v.p)
      local n=sat2:check(p1,p2)
      local m=self.cm&v.cl~=0
      if (n and m) return v.cl
    end
  end
end
