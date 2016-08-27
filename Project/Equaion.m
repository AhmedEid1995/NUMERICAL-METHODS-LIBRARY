
function [finalResult] = Equaion( x ,equation )
equation = strcat('@(x)',equation);
equation2 = str2func(equation);
finalResult =equation2(x);

end
