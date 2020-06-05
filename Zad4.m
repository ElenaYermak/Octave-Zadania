function [] = Zad4() 
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
  przestrzen = zeros(4, 100);
  for i = 1:tmp
    przestrzen(1,i) = x(i);
    przestrzen(2,i) = y(i);
    przestrzen(3,i) = z(i);
    przestrzen(4,i) = 1;
  endfor 
  
   figure;
   scatter3(x,y,z);
   title("Szescian");
   
   d = 0.5;
   macziezrzut = [1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 1/d 0]; 
   result = macziezrzut * przestrzen;
   normalizacja =  result(:,:)./result(4,:) ;
   
   figure;
   scatter3(result(1,:),result(2,:),result(3,:),"r");
   title("Rzutowanie bez normalizacji");
   
   figure;   
   scatter3(normalizacja(1,:),normalizacja(2,:),normalizacja(3,:));
   title("Rzutowanie z normalizacja");

endfunction