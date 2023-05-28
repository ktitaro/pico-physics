-- 𝘢ttempts to draw and paint
-- an arbitrary 2d polygon.
function draw_poly(v,c,s)
  s=(s or "line")
  for i=1,#v do
    if (s=="pset") then
      pset(v[i].x,v[i].y,c)
    elseif (s=="line") then
      local ni=i%#v+1
      local vc,vn=v[i],v[ni]
      line(vc.x,vc.y,vn.x,vn.y,c)
    end
  end
end



math={}

-- 𝘳ounds a number to the
-- nearest integer value.
function math.round(v)
  if (v<0) return flr(v)
  if (v>0) return ceil(v)
  return v
end



-- 𝘤onverts a number or an
-- array of numbers into its
-- binary representation.
function tobin(v)
  local b=0
  if (type(v)=="table") then
    for i=1,#v do b+=1<<v[i] end
  elseif (type(v)=="number") then
    b=1<<v
  end
  return b
end

-- 𝘤onverts bool into int.
function btoi(v)
  return v and 1 or 0
end



vec2={}
vec2.__index=vec2

-- 𝘤reates an instance of a vec2
-- using a given components (x,y).
function vec2:new(x,y)
  x,y=(x or 0),(y or 0)
  return setmetatable({
    x=x,y=y
  },self)
end

-- 𝘤alculates the squared
-- magnitude of the vector.
function vec2:mag2()
  local x=self.x
  local y=self.y
  return x^2+y^2
end

-- 𝘤alculates the magnitude
-- (or length) of the vector.
function vec2:mag()
  local m2=self:mag2()
  return sqrt(m2)
end

-- 𝘯ormalizes a 2d vector.
function vec2:norm()
  local m=self:mag()
  if (m==0) return self
  local x=self.x/m
  local y=self.y/m
  return vec2:new(x,y)
end

-- 𝘳eturns a vector that is
-- perpendicular to current.
function vec2:perp()
  local x,y=self.x,self.y
  return vec2:new(-y,x)
end

-- 𝘴cales a vector to the
-- given numerical factor.
function vec2:scale(f)
  local x=self.x*f
  local y=self.y*f
  return vec2:new(x,y)
end

-- 𝘳otates a vector by the
-- given amount of degrees.
function vec2:rotate(d)
  d=(d/360)
  local x=self.x
  local y=self.y
  x=x*cos(d)-y*sin(d)
  y=x*sin(x)+y*cos(d)
  return vec2:new(x,y)
end

-- 𝘤alculates the dot product
-- for a provided two vectors.
function vec2.dot(v1,v2)
  return v1.x*v2.x+v1.y*v2.y
end

-- 𝘨ives an ability to add
-- one vector to another one.
function vec2.__add(v1,v2)
  local x=v1.x+v2.x
  local y=v1.y+v2.y
  return vec2:new(x,y)
end

-- 𝘨ives an ability to substract
-- one vector from another one.
function vec2.__sub(v1,v2)
  local x=v1.x-v2.x
  local y=v1.y-v2.y
  return vec2:new(x,y)
end

-- 𝘨ives an ability to multiple
-- one vector with another one.
function vec2.__mul(v1,v2)
  local x=v1.x*v2.x
  local y=v1.y*v2.y
  return vec2:new(x,y)
end

-- 𝘨ives an ability to divide
-- one vector by another one.
function vec2.__div(v1,v2)
  local x=v1.x/v2.x
  local y=v1.y/v2.y
end

-- 𝘨ives an ability to compare
-- two vectors for equality.
function vec2.__eq(v1,v2)
  local x=v1.x==v2.x
  local y=v1.y==v2.y
  return x and y
end



-- 𝘴eparating 𝘢xis 𝘵heorem (or 𝘴𝘢𝘵)
-- algorithm for 2d convex polygons.
-- 𝘶sed to find collisions between
-- two convex polygons.

sat2={}

-- 𝘤hecks if two projections
-- are overlapping each other.
function sat2:overlap(p1,p2)
  local mn1,mx1=p1[1],p1[2]
  local mn2,mx2=p2[1],p2[2]
  return mx1>=mn2 and mx2>=mn1
end

-- 𝘱rojects polygon onto axis and
-- returns min & max projections.
function sat2:project(p,a)
  local mn,mx=(1/0),-(1/0)
  for _,v in ipairs(p) do
    local d=vec2.dot(v,a)
    mn=min(mn,d)
    mx=max(mx,d)
  end
  return {mn,mx}
end


-- 𝘵ests separation along the
-- axes of a given polygon #1.
function sat2:test(p1,p2)
  for i=1,#p1 do
    local n=i%(#p1)+1
    local edge=p1[n]-p1[i]
    local norm=edge:perp()
    if (not sat2:overlap(
      sat2:project(p1,norm),
      sat2:project(p2,norm)
    )) then return true end
  end
end

-- 𝘤hecks if two convex polygons
-- are colliding with each other.
function sat2:check(p1,p2)
  if (sat2:test(p1,p2)) return false
  if (sat2:test(p2,p1)) return false
  return true
end



-- 𝘳epresents an artbitrary 2d shape,
-- used as a base interface for other
-- more specific 2d shapes.

shape2={}
shape2.__index=shape2

-- 𝘱roperties
shape2.w=0 -- width of the shape
shape2.h=0 -- height of the shape

-- 𝘤reates an instance of shape2
-- using the provided set of props.
function shape2:new(p)
  return setmetatable(p,self)
end

-- 𝘢pproximates a shape2 to a
-- convex polygon and returns an
-- array of its vertexes while also
-- applying an offset to each of its
-- vertexes using a given vector `pt`.
function shape2:get_poly(pt)
  assert(false,"𝘯ot implemented!")
end



oval2={}
oval2.__index=oval2
setmetatable(oval2,shape2)

-- 𝘤reates an instance of an oval2
-- using the provided set of props.
function oval2:new(p)
  return shape2.new(self,p)
end

-- 𝘢pproximates an oval2 to a
-- convex polygon and returns an
-- array of its vertexes while also
-- applying an offset to each of its
-- vertexes using a given vector `pt`.
function oval2:get_poly(pt)
  pt=(pt or vec2:new())
  local p={}
  local dx=self.w/2
  local dy=self.h/2
  local s=max(dx,dy)
  local n=mid(8,s,16)
  for i=0,(n-1) do
    local a=(1/n)*i
    local x=dx*cos(a)
    local y=dy*sin(a)
    add(p,vec2:new(
      dx+math.round(x),
      dy+math.round(y)
    )+pt)
  end
  return p
end



rect2={}
rect2.__index=rect2
setmetatable(rect2,shape2)

-- 𝘤reates an instance of a rect2
-- using the provided set of props.
function rect2:new(p)
  return shape2.new(self,p)
end

-- 𝘢pproximates an oval2 to a
-- convex polygon and returns an
-- array of its vertexes while also
-- applying an offset to each of its
-- vertexes using a given vector `pt`.
function rect2:get_poly(pt)
  pt=(pt or vec2:new())
  local w=self.w
  local h=self.h
  return {
    vec2:new(0,0)+pt,
    vec2:new(w,0)+pt,
    vec2:new(w,h)+pt,
    vec2:new(0,h)+pt,
  }
end



poly2={}
poly2.__index=poly2
setmetatable(poly2,shape2)

-- 𝘱roperties:
poly2.e={} -- vertexes

-- 𝘤reates an instance of a poly2
-- using the provided set of props.
function poly2:new(p)
  local obj=shape2.new(self,p)
  obj.w,obj.h=obj:get_size()
  return obj
end

-- 𝘤alculates the width and height
-- of an arbitrary convex polygon.
function poly2:get_size()
  local l=self.e[1].x
  local r=self.e[1].x
  local t=self.e[1].y
  local b=self.e[1].y
  for i=2,#self.e do
    local v=self.e[i]
    if (v.x<l) l=v.x
    if (v.x>r) r=v.x
    if (v.y<t) r=v.y
    if (v.y>b) b=v.y
  end
  local w=(r-l)
  local h=(b-t)
  return w,h
end

-- 𝘴ince poly2 doesn't need any
-- approximation, it will return an
-- array of its vertexes while also
-- applying an offset to each of its
-- vertexes using a given vector `pt`.
function poly2:get_poly(pt)
  pt=(pt or vec2:new())
  local p={}
  for i=1,#self.e do
    add(p,self.e[i]+pt)
  end
  return p
end



area={}
area.__index=area
setmetatable(area,shape2)

-- 𝘱roperties:
area.cm=0 -- collision mask
area.cl=0 -- collision layer
area.p=vec2:new() -- position (x,y)

-- 𝘤reates an instance of an area
-- using the provided set of props.
function area:new(shape,p)
  if (p.cl) p.cl=tobin(p.cl)
  if (p.cm) p.cm=tobin(p.cm)
  setmetatable(shape,self)
  return shape:new(p)
end

-- 𝘤hecks if area would collide with
-- a map tile at a given point `pt`.
function area:hits_tile_at(pt)
  local x,y=(pt.x/8),(pt.y/8)
  local cl=1<<fget(mget(x,y))
  if (self.cm&cl~=0) return cl
end

-- 𝘤hecks if area would collide with any
-- other area at the provided point `pt`.
-- 𝘪t requires a list of all the defined
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



body={}
body.__index=body
setmetatable(body,area)

-- 𝘱roperties:
body.m=0 -- mass of the body
body.g=vec2:new() -- gravity force (x,y)
body.v=vec2:new() -- velocity amount (x,y)
body.d=vec2:new() -- motion direction (x,y)
body.r=vec2:new() -- motion reminder (x,y)
body.reg={} -- game objects registry

-- 𝘤reates an instance of a body
-- using a provided set of props.
function body:new(shape,p)
  return area.new(self,shape,p)
end

-- 𝘶pdates body physics.
function body:upd()
  self:apply_g()
  local kx=self:move_x()
  local ky=self:move_y()
  return (kx or ky)
end

-- 𝘤alculates gravity force
-- relative to a body's mass
-- and applies it to the body.
function body:apply_g()
  self.v+=self.g:scale(self.m)
end

-- 𝘢ttempts to move the body along
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

-- 𝘢ttempts to move the body along
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

-- 𝘦nsures that the body moves in whole
-- numbers of pixels on the x-axis and
-- calculates the distance and direction
-- for the next move.
function body:setup_x()
  local rx,vx=self.r.x,self.v.x
  local dt,dr=flr(rx+vx),sgn(vx)
  self.r.x,self.d.x=(rx+vx-dt),dr
  return dt,dr
end

-- 𝘦nsures that the body moves in whole
-- numbers of pixels on the y-axis and
-- calculates the distance and direction
-- for the next move.
function body:setup_y()
  local ry,vy=self.r.y,self.v.y
  local dt,dr=flr(ry+vy),sgn(vy)
  self.r.y,self.d.y=(ry+vy-dt),dr
  return dt,dr
end

-- 𝘤hecks if body would collide with
-- either a map tile or another area
-- on the next step on the x axis.
function body:check_x(dr)
  local r=self.reg
  local p1=self.p+vec2:new(dr,0)
  local k1=self:hits_area_at(r,p1)
  if (k1~=nil) return k1
  for i=1,self.h do
    local dy=(self.h-i)
    local dx=(self.w/2*(dr+1))
    local p2=p1+vec2:new(dx,dy)
    local k2=self:hits_tile_at(p2)
    if (k2~=nil) return k2
  end
end

-- 𝘤hecks if body would collide with
-- either a map tile or another area
-- on the next step on the y axis.
function body:check_y(dr)
  local r=self.reg
  local p1=self.p+vec2:new(0,dr)
  local k1=self:hits_area_at(r,p1)
  if (k1~=nil) return k1
  for i=1,self.w do
    local dx=(self.w-i)
    local dy=(self.h/2*(dr+1))
    local p2=p1+vec2:new(dx,dy)
    local k2=self:hits_tile_at(p2)
    if (k2~=nil) return k2
  end
end
