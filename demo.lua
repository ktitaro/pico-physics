local plr=nil
local reg={}

function _init()
  add(reg,create_poly(20,20,-1,{1,-2}))
  add(reg,create_rect(64,64,-2,0))
  plr=reg[1]
end

function _draw()
  cls()
  map(0,0,0,0)
  draw_reg()
end

function _update()
  move_plr()
end

function create_oval(x,y,cl,cm)
  return body:new(oval2,{
    p=vec2:new(x,y),
    w=8,h=8,c=10,
    cl=cl,cm=cm,
  })
end

function create_rect(x,y,cl,cm)
  return body:new(rect2,{
    p=vec2:new(x,y),
    w=10,h=10,c=10,
    cl=cl,cm=cm,
  })
end

function create_poly(x,y,cl,cm)
  return body:new(poly2,{
    p=vec2:new(x,x),
    w=10,h=10,c=10,
    cl=cl,cm=cm,
    v={
      vec2:new(5,0),
      vec2:new(10,10),
      vec2:new(0,10),
    }
  })
end

function draw_reg()
  for _,v in ipairs(reg) do
    local p=v:get_poly(v.p)
    draw_poly(p,v.c)
  end
end

function move_plr()
  local d=vec2:new()
  d.x=btoi(btn(➡️))-btoi(btn(⬅️))
  d.y=btoi(btn(⬇️))-btoi(btn(⬆️))

  local p1=plr.p+d
  local k1=plr:hits_body_at(reg,p1)
  if (k1~=nil) plr.c=8;return

  local p2=plr.p+d
  if (d.x>0) p2.x+=plr.w
  if (d.y>0) p2.y+=plr.h
  local k2=plr:hits_tile_at(p2)
  if (k2~=nil) plr.c=8;return

  plr.c=10
  plr.p=p1
end
