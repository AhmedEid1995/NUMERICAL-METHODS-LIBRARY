function [ x , errors ] = Newton( equation,max,es,x0 ,handles)
tic;
x(1)=x0;
dfX = diff(sym(equation),1)
dfX = inline(dfX);
equation = inline(equation)
x2 = -100:.1:100;
ezplot(equation);
hold on
ea = 0 ;
i=2;
divByZero = 0;
while(i <= (max)+1)
    if(dfX(x(i-1)) == 0)
        divByZero = 1;
        printf('%d' , divByZero)
        break;
    end 
    x(i)=x(i-1)-(equation(x(i-1))/dfX(x(i-1)))
    ea=abs((x(i-1)-x(i)));
    errors(i) = ea
    if(ea < es)
        break;
    end
    i=i+1;
    numberOfItrations = i - 1;
    fprintf('%d',numberOfItrations);
     y2 = x(numberOfItrations);
     plot(y2,x2,'g');
        %hold
    hold on
   % Table(numberOfItrations,:)=[x(i) error(i)]
   
end
set(handles.answer , 'String' ,x(i))
set(handles.time, 'String' ,toc);
end

