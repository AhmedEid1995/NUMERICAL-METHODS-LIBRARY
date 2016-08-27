function [result] = bisectionMethod(x_lower, x_upper, es, Max,equation, handles)
    tic;
    previous = x_upper
    %get the values of F(xr) & F( xl)
    fxl = Equaion(x_lower,equation)
    fxu = Equaion(x_upper,equation)
    %printing table
    x = -100:.1:100;
    ezplot(equation);
    hold on
    column = {'LOOP' 'Xl' 'Xu'  'Xr'  'F(xl)' 'F(xu)' 'F(xr)'  'eps'   };
    set(handles.table,'ColumnName' , column);
    %fprintf('+-----+-----------+----------+-----------+-----------+-------+-------+-------+--------\n');
    %fprintf('|LOOP |     Xl    |    Xu    |     Xr    |   F(xl)   |   F(xu)   |   F(xr)   | eps   |\n');
    xr=0;
    for i = 1:Max 
        %fprintf('+-------------------------------------------------------------------------------------|\n');
            %get new xr
        xr = (x_lower+x_upper)/2
        %calculate eps
        currentEps = abs((xr - previous)/xr)
        previous = xr
        %get F(XR )
        fxr = Equaion(xr,equation)
        %printing values of table
        %fprintf('|%g    | %f | %f | %f | %f | %f | %f |',i,x_lower,x_upper,xr,fxl,fxu,fxr);
        %print eps except first case
        if(i == 1)
            %fprintf('------\n');
        else
            %fprintf(' %f\n',currentEps);
        end
        
        tableA(i,:)=[i x_lower x_upper xr fxl fxu fxr eps];
        y1 = x_lower;
        plot(y1,x,'r');
        y2 = x_upper;
        plot(y2,x,'g');
        %hold
        hold on
        %stopping condition
         if(fxr == 0 || currentEps < es)
            break;
         end
       %determine to accept which part and throw which one 
        if(fxl * fxr < 0)
            fxu = fxr;
            x_upper = xr;
            
        elseif(fxu * fxr < 0)
            fxl = fxr;
            x_lower = xr;
            
        end
        
    end
    set(handles.table, 'Data' ,tableA);
    %fprintf('+------------------------------------------------------------------------------------------');
    result = xr;
    %end of program 
    hold off
    runningTime = toc;
set(handles.time, 'String' , runningTime);
end