-- Creates an area with the shape
-- of an oval using a given props.
function create_oval(props)
  return area:new(oval2,{
    w=(props.w or 10),
    h=(props.h or 10),
    cl=(props.cl or 1),
    col=(props.col or 13),
    p=vec2:new(
      (props.x or 0),
      (props.y or 0))
  })
end

-- Creates an area with the shape
-- of a rect using a given props.
function create_rect(props)
  area:new(rect2,{
    w=(props.w or 10),
    h=(props.h or 10),
    cl=(props.cl or 1),
    col=(props.col or 13),
    p=vec2:new(
      (props.x or 0),
      (props.y or 0))
  })
end

-- Generates a list of random
-- areas with a random shape.
function gen_things(n)
  local t={}
  for i=1,n do
    local fn=(rnd()>0.5 and
      create_rect or
      create_oval)
    add(t,fn({
      x=mid(10,ceil(rnd(110)),110),
      y=mid(10,ceil(rnd(110)),110),
      w=ceil(rnd(5))+5,
      h=ceil(rnd(5))+5,
    }))
  end
  return t
end
