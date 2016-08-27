function [ result ] = FalsePosition(xl, xu, es, imax, equation , handles)
tic;
    fu = Equaion(xu, equation);
    fl = Equaion(xl, equation);
    initialXU = xu;
    initialXL = xl;
    il = 0;
    iu = 0;
    
    %y = inline(equation);  % Inline function made from string 
    x = -100:.1:100;
    %plot(x,y(x))
    %axis([-initialXL initialXL -initialXU initialXU]);
    %answer = handles.axes1;
    %axis(answer)
    ezplot(equation);
    hold on
    
    column = {'LOOP' 'Xl' 'Xu'  'Xr'  'F(xr)'  'eps'   };
    set(handles.table,'ColumnName' , column);
    %fprintf('+-----+-----------+----------+-----------+-----------+-------+\n');
    %fprintf('|loop |     xl    |    xu    |     xr    |   f(xr)   | eps   |\n');
    %fprintf('+-----+-----------+----------+-----------+-----------+-------+\n');
    for i = 1:imax
        
        if  i ~=1
            xrOld = xr;
        end
        
        xr = xu - fu*(xu-xl)/(fu-fl);
        fr =  Equaion(xr , equation);
        
        eps = 100;
        if i ~= 1
            eps = abs((xr-xrOld)/xr);
        end
        
        %fprintf('|%g    | %f | %f | %f | %f |',i,xl,xu,xr,fr);
        
        
        if(i ~= 1)
            fprintf('%f\n',eps);
        else
            fprintf('-------\n');
        end
        
        tableA(i,:)=[i xl xu xr fr eps];
        y1 = xl;
       % plot(y1,x,'r');
        y2 = xu;
       % plot(y2,x,'g');
       % hold on;
        %ezplot(equation);
        plot(y1,x,'r');
        plot(y2,x,'g');
        %hold
        hold on;
        %plot(xu);
       % hold on
        if(eps < es || fr == 0)
            break;
        end
        
        test = fr * fl;
        
        if test < 0
            xu = xr;
            fu = fr;
            iu = 0;
            il = il+1;
            if il >= 2
                fl = fl/2;
            end
        end
        
        if test > 0
            xl = xr;
            fl = fr;
            il = 0;
            iu = iu+1;
            if iu >= 2
                fu = fu/2;
            end
        end
        
    end
    set(handles.table, 'Data' ,tableA);
    result = xr;
    runningTime = toc;
set(handles.time, 'String' , runningTime);
hold off
    %fprintf('+-------------------------------------------------------------');

end


