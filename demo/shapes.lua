function create_oval(w,h,x,y)
  return body:new(oval2,{
    p=vec2:new(x,y),
    cl={2},w=w,h=h,
    col=13,
  })
end

function create_rect(w,h,x,y)
  return body:new(rect2,{
    p=vec2:new(x,y),
    cl={2},w=w,h=h,
    col=13,
  })
end
