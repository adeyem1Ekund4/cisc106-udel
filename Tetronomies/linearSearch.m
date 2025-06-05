function index = linearSearch(x,t)
n = length(x);
flag = 0;
for i = 1:n
    if x(i)==t
        index =i;
        flag=1;
    end
end
if flag == 0
    index = -1;
    disp(linearSearch(x,t))
end