local reg={}

function _init()
  add(reg,robby:new(10,10,reg))
  -- add(reg,rubby:new(90,90,reg))
  -- add(reg,rubby:new(30,50,reg))
  -- add(reg,rubby:new(90,30,reg))
end

function _update()
  for v in all(reg) do
    v:upd()
  end
end

function _draw()
  cls();map(0,0,0,0)
  for v in all(reg) do
    v:drw()
  end
end
