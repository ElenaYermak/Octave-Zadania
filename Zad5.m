function [] = Zad5()
  
  space = zeros(100,100,10);
  
  for i=1:10
    x0 = round(10 + (50 - 10)*rand(1,1));
    y0 = round(10 + (50 - 10)*rand(1,1));
    x1 = round(5 + (50 - 5)*rand(1,1));
    y1 = round(5 + (50 - 5)*rand(1,1));
    z0 = round(1 + (10 - 1)*rand(1,1));
    space(x0:x0+x1, y0:y0+y1, z0) = i;
    
   endfor
   
   image = zeros(100,100);
   
   for z = 10:-1:1
     for y = 1:100
       for x = 1:100
         if space(x,y,z) != 0
           image(x, y) = space(x,y,z);
         endif
       endfor
     endfor
   endfor
   
   figure;
   imshow(image);
   
   figure;
   l = mat2gray(image);
   imshow(l);
   
endfunction
