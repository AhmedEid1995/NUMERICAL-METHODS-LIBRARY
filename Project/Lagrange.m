function [output] = Lagrange(order, pointXY ,handles)
tic;
    order = order+1;
    outputstr = '';
    for i=1:order
        Lstring = '';
        for j=1:order 
            if i == j 
                continue;
            end;
            numstr = strcat('( x - ', num2str(pointXY(j,1)), ' )');
            denominator = pointXY(i,1) - pointXY(j,1);
            if isempty(Lstring)
                Lstring = strcat('( ', numstr, ' / ', num2str(denominator), ' )');
            else
                Lstring = strcat(Lstring, ' * ( ', numstr, ' / ', num2str(denominator), ' )');
            end;
        end;
        
        if isempty(outputstr)
            outputstr = strcat('( ', Lstring, ' * ', num2str(pointXY(i,2)), ' )');
        else
            outputstr = strcat(outputstr, ' + ( ', Lstring, ' * ', num2str(pointXY(i,2)), ' )');
        end
    end;
    outputsym = sym(outputstr);
    outputsym = expand(outputsym);
    outputstr = char(outputsym);
    outputstr = strcat('@(x)', outputstr);
    output = str2func(outputstr);
    ezplot(outputsym)
    time = toc;
    set(handles.timeAnswer,'String',time);
end