x1 = 8.1910;
u1 = -0.4370;
gamma = 0.1;
steps = zeros(50, 3);
steps(1,1) = x1;
steps(1,2) = u1;
steps(1,3) = 4*x1^2 + 5*u1^2 + 7*x1*u1 + 5*x1 + 6*u1 - 8;

for i=2:1:50
    x = steps(i-1,1);
    u = steps(i-1,2);
    vect = [x; u] - gamma*[8*x+7*u+5; 10*u+7*x+6];
    steps(i,1) = vect(1);
    steps(i,2) = vect(2);
    steps(i,3) = 4*steps(i,1)^2+5*steps(i,2)^2+7*steps(i,1)*steps(i,2)...
        +5*steps(i,1)+6*steps(i,2)-8;
    if steps(i,3) > steps(i-1,3)
        break
    end
end

hold on
plot((1:50), steps(:,1)')
plot((1:50), steps(:,2)')
grid on
xlabel('x,u')