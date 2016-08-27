function [x,ea,runningTime] = fixed_point( fn , x , es, iter_max,handles)
tic;
fn = strcat(fn,' + x');
x = eval(fn);
column = {'LOOP' 'Xold' 'Xnew'  'eps'   };
set(handles.table,'ColumnName' , column);
x2 = -100:.1:100;
ezplot(fn);
    hold on
iter = 0;        
x_old = 0;
x_old = x;
x = eval(fn)
if (x ~= 0)  
    ea = abs((x - x_old) / x) * 100;
end
iter = iter+1;

while (ea > es && iter < iter_max)
    x_old = x;
    x = eval(fn)
    if (x ~= 0)  
        ea = abs((x - x_old) / x) * 100;
    end
   
    tableA(iter,:)=[iter x_old x  ea];
        y1 = x_old;
        plot(y1,x2,'r');
        y2 = x;
        plot(y2,x2,'g');
        %hold
        hold on

    iter = iter+1;
end
hold off
set(handles.table, 'Data' ,tableA);
runningTime = toc;
set(handles.time, 'String' , runningTime);
end