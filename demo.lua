local plr=nil
local reg={}

function _init()
  add(reg,create_oval(20,20,-1,{1,-2}))
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
    w=8,
    h=8,
    c=10,
    cl=cl,
    cm=cm,
    reg=reg,
    g=vec2:new(0,0.5),
    m=1,
  })
end

function create_rect(x,y,cl,cm)
  return body:new(rect2,{
    p=vec2:new(x,y),
    w=10,
    h=10,
    c=10,
    cl=cl,
    cm=cm,
    reg=reg,
    g=vec2:new(0,0.5),
    m=1,
  })
end

function create_poly(x,y,cl,cm)
  local trig={}
  add(trig,vec2:new(5,0))
  add(trig,vec2:new(10,10))
  add(trig,vec2:new(0,10))
  return body:new(poly2,{
    p=vec2:new(x,x),
    w=10,
    h=10,
    c=10,
    cl=cl,
    cm=cm,
    e=trig,
    reg=reg,
    g=vec2:new(0,0.5),
    m=1,
  })
end

function draw_reg()
  for _,v in ipairs(reg) do
    local p=v:get_poly(v.p)
    draw_poly(p,v.c)
  end
end

function move_plr()
  plr.v=vec2:new()
  plr.v.x=btoi(btn(➡️))-btoi(btn(⬅️))
  plr.v.y=btoi(btn(⬇️))-btoi(btn(⬆️))
  plr:upd()
end
