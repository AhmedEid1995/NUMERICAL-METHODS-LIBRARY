function[result] = birage_veta(x0, es, numOfItrations, polynomial, handles)
tic;
equation = strcat('@(x)',polynomial);
equation2 = str2func(equation);
coff = sym2poly(sym(equation2));
x = -100:.1:100;
ezplot(polynomial);
  hold on
column = { 'X' 'eps' };
set(handles.table,'ColumnName' , column);
matrix = zeros(length(coff), 3);
matrix(:, 1) = coff;
e = 100;
matrix(1,2) = matrix(1,1);
matrix(1,3) = matrix(1,1);
numOfItr = 1;
while abs(e) >= es 
  for i = 2:length(coff)
    matrix(i,2) = matrix(i,1) + x0 * matrix(i-1,2);
    matrix(i,3) = matrix(i,2) + x0 * matrix(i-1,3);
  end
  element = matrix(length(coff),2) / matrix(length(coff) - 1,3);
  x1 = x0 - element;
  e = (x1 - x0) / x1;
  x0 = x1;
  %tableA=[ x1 e];
   tableA(numOfItr,:)=[numOfItr-1 x1 e];
   y1 = x1;
   plot(y1,x,'r');
   %hold
   hold on
        
  numOfItr = numOfItr + 1;
  
  if numOfItr == numOfItrations + 1
      break;
  end
end
result = x1;
set(handles.table, 'Data' ,tableA);
runningTime = toc;
set(handles.time, 'String' , runningTime);
hold off
end