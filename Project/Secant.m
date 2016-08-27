function [ x ,errors] = Secant( equation,max,es,x0,x1 ,handles)
tic;
x(1)=x0;
x(2)=x1;
equation = inline(equation);
i=3;
x2 = -100:.1:100;
ezplot(equation);
hold on
diffIsNearZero = 0 ; 
while(i<=(max)+1)
    if((equation(x(i-2))-equation(x(i-1)))==0)
        diffIsNearZero = 1;
        fprintf('%d',diffIsNearZero);
        break;
    end 
    x(i)=x(i-1)-(equation(x(i-1))*(x(i-2)-x(i-1)))/(equation(x(i-2))-equation(x(i-1)));
    ea=abs((x(i-1)-x(i)));
    errors(i)=ea;
    if(ea < es)
        break;
    end
    i=i+1;
    numberofItrations = i - 2 ;
    fprintf('%d',numberofItrations);
     y2 = x(numberofItrations);
     plot(y2,x2,'g');
        %hold
    hold on
end
set(handles.answer , 'String' ,x(i))
set(handles.time, 'String' ,toc);
end