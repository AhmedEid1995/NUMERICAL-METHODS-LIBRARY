function [ answer ] = newton(xl, xu, es, imax)
tic;
    fu = Fx(xu);
    fl = Fx(xl);
    
    il = 0;
    iu = 0;
    
    
    xrOld=0;
    for i = 1:imax
        
        if  i ~=1
            xrOld = xr;
        end
        
        xr = xu - fu*(xu-xl)/(fu-fl);
        fr =  Fx(xr);
        
        ea=100;
        if i ~= 1
            ea = abs((xr-xrOld)/xr);
        end
        if(i==1)
            fprintf(':%g    : %f : %f : %f : %f :-------\n',i,xl,xu,xr,fr);
        else 
            fprintf(':%g    : %f : %f : %f : %f : %f \n',i,xl,xu,xr,fr,ea);
        
        end
        
        if(ea < es || fr == 0)
            break;
        end
        
        test = fr * fl;
        if test > 0
            xl = xr;
            fl = fr;
            il = 0;
            iu = iu+1;
            if iu >= 2
                fu = fu/2;
            end
        end
        if test < 0
            xu = xr;
            fu = fr;
            iu = 0;
            il = il+1;
            if il >= 2
                fl = fl/2;
            end
        end
        
        
        
    end
    
    answer = xr;
    fprintf('--------------------------------------------------------------');
    runningTime = toc;
set(handles.time, 'String' , runningTime);
hold off

end
function [sub] = Fx( value )
    
    sub = 3*value^4+6.1*value^3-2*value^2+3*value+2;
end

