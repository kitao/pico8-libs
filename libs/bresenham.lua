function los(x1,y1,x2,y2,fn)
 x1=flr(x1+0.5)
 y1=flr(y1+0.5)
 x2=flr(x2+0.5)
 y2=flr(y2+0.5)

 local sx,sy,dx,dy

 if x1<x2 then
  sx=1
  dx=x2-x1
 else
  sx=-1
  dx=x1-x2
 end

 if y1<y2 then
  sy=1
  dy=y2-y1
 else
  sy=-1
  dy=y1-y2
 end

 local err=dx-dy
 local er2,res

 res=fn(x1,y1)
 if res then return res end

 while x1~=x2 or y1~=y2 do
  er2=shl(err,1)

  if er2>-dy then
   err=err-dy
   x1=x1+sx
  end

  if er2<dx then
   err=err+dx
   y1=y1+sy
  end

  res=fn(x1,y1)
  if res then return res end
 end
end
