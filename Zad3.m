function [] = Zad3() 
  tmp=0;
  
  for X=1:10
    for Y=1:20
      for Z=1:20
        tmp=tmp+1;
        x(tmp)=X;
        y(tmp)=Y;
        z(tmp)=Z;
      endfor
    endfor
  endfor
  for X=10:20
    for Y=1:10
      for Z=1:20
        tmp=tmp+1;
        x(tmp)=X;
        y(tmp)=Y;
        z(tmp)=Z;
      endfor
    endfor
  endfor
scatter3(x,y,z)
endfunction