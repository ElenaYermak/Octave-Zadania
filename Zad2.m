function [] = Zad2()
  printf("Wektory musza byc rowne\n");
  x = input("Podaj wartosc x: ");
  y = input("Podaj wartosc y: ");
  znak = input("Podaj operacje do wykonania ('+','-','s','w','l'): ");
  % '+' dodawanie
  % '-' odejmowanie
  % 's' iloczyn skalarny
  % 'w; iloczyn wektorowy
  % 'l' d?ugo?c wektora
  
  if znak == '+' 
    w = x+y;
    printf("Dodawanie\n");
    display(w);
    return;
  endif
  
  if znak == '-'
    w = x-y;
    printf("Odejmowanie\n");
    display(w);
  endif
  
 if znak == 's'
   l = length(x)
   s = 0;
   for i = 1:l
     s = s+x(i)*y(i);
   endfor
   printf("Iloczyn skalarny\n");
   display(s);
   return;
 endif
  
  if znak == 'w'
    w = cross(x,y);
    printf("Iloczyn wektorowy\n");
    display(w);
    return;
  endif
 
  if znak == 'l'
    l = length(x)
    s = 0;
    for i = 1:l
      s = s+x(i)*x(i);
    endfor
    w = sqrt(s);
    printf("Dlugosc wektora\n");
    display(w);
  endif
endfunction
