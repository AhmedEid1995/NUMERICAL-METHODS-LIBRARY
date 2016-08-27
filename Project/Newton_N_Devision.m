function result = Newton_N_Devision(xy,handles)
tic;
mab = zeros(length(xy), length(xy) );
mab(:,1) = xy(:,2);
x = xy(:,1);

result = 0;
resultStr = '';
for i = 2 : length(x)
    for j = 2 : i
        mab(i,j)=(mab(i,j-1)-mab(i-1,j-1))/(x(i)-x(i - j + 1));
        
    end 
end
for i = 1 : length(x)
    element = num2str(mab(i,i));
    for j = 1: i - 1
        element = strcat(element, '* ( x - (', num2str(x(j)), '))' );
    end
    resultStr = strcat(resultStr, ' + ', element);
        
%    element = mab(i, i);
%    for j = 1 : i - 1
%        element = element * (targetX - x(j));
%    end
%    result = result + element;
end
resultSym = sym(resultStr);
resultSym2 = expand(resultSym);
resultStr = char(resultSym2);
result = str2func(strcat('@(x)', resultStr));
ezplot(resultSym2)
time = toc;
set(handles.timeAnswer, 'String',time);
end       
           
                
            
        
        