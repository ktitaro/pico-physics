body={}
body.__index=body
setmetatable(body,area)

-- Properties:
body.m=0 -- mass of the body
body.g=vec2:new() -- gravity force (x,y)
body.v=vec2:new() -- velocity amount (x,y)
body.d=vec2:new() -- motion direction (x,y)
body.r=vec2:new() -- motion reminder (x,y)
body.reg={} -- game objects registry

-- Creates an instance of a body
-- using a provided set of props.
function body:new(shape,p)
  return area.new(self,shape,p)
end

-- Updates body physics.
function body:upd()
  self:apply_g()
  local kx=self:move_x()
  local ky=self:move_y()
  return (kx or ky)
end

-- Calculates gravity force
-- relative to a body's mass
-- and applies it to the body.
function body:apply_g()
  self.v+=self.g:scale(self.m)
end

-- Attempts to move the body along
-- the x-axis if there is a non-zero
-- velocity provided.
function body:move_x()
  if (self.v.x==0) return
  local dt,dr=self:setup_x()
  while (dt~=0) do
    local k=self:check_x(dr)
    if (k~=nil) self.v.x=0
    if (k~=nil) return k
    self.p.x+=dr
    dt-=dr
  end
end

-- Attempts to move the body along
-- the y-axis if there is a non-zero
-- velocity provided.
function body:move_y()
  if (self.v.y==0) return
  local dt,dr=self:setup_y()
  while (dt~=0) do
    local k=self:check_y(dr)
    if (k~=nil) self.v.y=0
    if (k~=nil) return k
    self.p.y+=dr
    dt-=dr
  end
end

-- Ensures that the body moves in whole
-- numbers of pixels on the x-axis and
-- calculates the distance and direction
-- for the next move.
function body:setup_x()
  local rx,vx=self.r.x,self.v.x
  local dt,dr=flr(rx+vx),sgn(vx)
  self.r.x,self.d.x=(rx+vx-dt),dr
  return dt,dr
end

-- Ensures that the body moves in whole
-- numbers of pixels on the y-axis and
-- calculates the distance and direction
-- for the next move.
function body:setup_y()
  local ry,vy=self.r.y,self.v.y
  local dt,dr=flr(ry+vy),sgn(vy)
  self.r.y,self.d.y=(ry+vy-dt),dr
  return dt,dr
end

-- Checks if body would collide with
-- either a map tile or another area
-- on the next step on the x axis.
function body:check_x(dr)
  local k,r=nil,self.reg
  local p1=self.p+vec2:new(dr,0)
  local p2=self.p+vec2:new(dr,0)
  if (dr>0) p1.x+=self.w
  k=(k or self:hits_tile_at(p1))
  k=(k or self:hits_area_at(r,p2))
  if (k~=nil) return k
end

-- Checks if body would collide with
-- either a map tile or another area
-- on the next step on the y axis.
function body:check_y(dr)
  local k,r=nil,self.reg
  local p1=self.p+vec2:new(0,dr)
  local p2=self.p+vec2:new(0,dr)
  if (dr>0) p1.y+=self.h
  k=(k or self:hits_tile_at(p1))
  k=(k or self:hits_area_at(r,p2))
  if (k~=nil) return k
end
