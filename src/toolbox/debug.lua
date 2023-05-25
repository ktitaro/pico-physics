-- Generates a random polygon
-- with n vertexes and scales
-- it proportional to `s`.
function rand_poly(n,s)
  s=(s or 25)
  local p={}
  for i=1,n do
    local x=ceil(rnd()*s)
    local y=ceil(rnd()*s)
    x=14+mid(0,x,100)
    y=14+mid(0,y,100)
    add(p,vec2:new(x,y))
  end
  return p
end

-- Draws a polygon `p` and
-- paints it into color `k`.
function draw_poly(p,k)
  for i=1,#p do
    local ni=i%#p+1
    local c,n=p[i],p[ni]
    line(c.x,c.y,n.x,n.y,k)
  end
end
