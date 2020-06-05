function [] = Zad1(r,g,b)
  %CMYK
  rn = r/255;
  gn = g/255;
  bn = b/255;
  k = 1 - (max([rn, gn, bn]));
  c = ((1-rn-k)/(1-k))*100;
  m = ((1-gn-k)/(1-k))*100;
  y = ((1-bn-k)/(1-k))*100;
  k = k*100;
  printf("CMYK: \n %d, %d, %d, %d", c,m,y,k);
  rgb = [r; g; b];
  rgb2xyz =  [0.49000 0.31000 0.20000, 
              0.17697 0.81240 0.01063
              0.00000 0.01000 0.99000];
  display(rgb2xyz);  
  rgbn = rgb2xyz*rgb;       
  printf("\nCIEXYZ:");
  printf("\n%d\n", rgbn);
  
  x0 = 94.81;
  y0 = 100.0;
  z0 = 107.3;
  
  %znajdowanie y/yr i L
  y1 = rgbn(2)/y0;
  if y1 > 0.008856 
    fy = y1^(1/3);
    else  
    fy = (903.3*y1 +16)/116;
  endif
  L = 116*fy -16;
  
  %znajdowanie x/xr i a
  x1 = rgbn(1)/x0;
  if x1 > 0.008856 
    fx = x1^(1/3);
    else  
    fx = (903.3*x1 +16)/116;
  endif
  a = 500*(fx - fy);
  
  %znajdowanie z/zr i b
  z1 = rgbn(3)/z0;
  if z1 > 0.008856 
    fz = z1^(1/3);
    else  
    fz = (903.3*z1 +16)/116;
  endif
  B = 200*(fy - fz);
  
  CIELab = [L,a,B];
  printf("\nCIELab:\n");
  display(CIELab); 
  
  %CIELUV
  u0 = 0.2009;
  v0 = 0.4610;
  up = 4*rgbn(1)/(rgbn(1) +15*rgbn(2)+3*rgbn(3));
  vp = 9*rgbn(2)/(rgbn(1) +15*rgbn(2)+3*rgbn(3));
  if y1 > (6/29)^3
    L1 = 116*(y1)^(1/3) - 16;
  else
    L1 = (29/3)^3 *y1;
  endif
  u = 13*L1 *(up - u0);
  v = 13*L1 *(vp - v0);
  CIELUV = [L1,u,v];
  printf("\nCIELUV:\n");
  display(CIELUV); 
  
  %HSV
  rgb = [r,g,b]
  rgbMax = max(rgb);
  rgbMin = min(rgb);
  %H
  if rgbMax == rgbMin
    H = 0;
  endif
  if rgbMax == r && g >= b
    H = 60*((g - b)/(rgbMax - rgbMin));
  endif
  if rgbMax == r && g < b
    H = 60*((g - b)/(rgbMax - rgbMin)) + 360;
  endif
  if rgbMax == g
    H = 60*((b - r)/(rgbMax - rgbMin)) + 120;
  endif
  if rgbMax == b
    H = 60*((r - g)/(rgbMax - rgbMin)) + 240;
  endif
  %S
  if rgbMax == 0
    S = 0;
  else
    S = 1 - (rgbMin/rgbMax);
  endif
  V = rgbMax;
  HSV = [H,S,V];
  printf("\nHSV:\n");
  display(HSV);
 
 %HSL
 cmax = max([rn,gn,bn]);
 cmin = min([rn,gn,bn]);
 deltac = cmax - cmin;
 %H
 if deltac == 0
   H_HSL = 0;
 endif
 if cmax == rn;
   H_HSL = 60*mod((gn-bn)/deltac,6);
 endif
 if cmax == gn
   H_HSL = 60*((bn-rn)/deltac + 2);
 endif
 if cmax == bn
   H_HSL = 60*((rn-gn)/deltac + 4);
 endif
 %L
 L_HSL = (cmax + cmin)/2;
 %S
 if deltac == 0
   S_HSL = 0;
 else 
   S_HSL = deltac/(1 - abs(2*L_HSL-1));
 endif
  HSL = [H_HSL,S_HSL,L_HSL];
  printf("\nHSL:\n");
  display(HSL);
 
 %YUV
 kr = 0.2627;
 kb = 0.0593;
 Y_YUV = kr*r + (1-kr-kb)*g + kb*b;
 U_YUV = b - Y_YUV;
 V_YUV = r -Y_YUV;
 YUV = [Y_YUV,U_YUV,V_YUV];
  printf("\nYUV:\n");
  display(YUV);
  
 %YIQ
 Y_YIQ = 0.229*r + 0.587*g + 0.114*b;
 I_YIQ = 0.596*r - 0.274*g - 0.322*b;
 Q_YIQ = 0.211*r - 0.522*g + 0.311*b;
 YIQ = [Y_YIQ,I_YIQ,Q_YIQ];
 printf("\nYIQ:\n");
 display(YIQ);
 
endfunction
