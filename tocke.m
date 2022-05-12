v = zeros(2,1000);
%% 300 tocaka oko (0,0)
v(1,1:300) = 2.*rand(300,1) - 1;
v(2,1:300) = 2.*rand(300,1) - 1;
%% 300 tocaka oko (4,3)
v(1,301:600) = 2.*rand(300,1) + 3;
v(2,301:600) = 2.*rand(300,1) + 3;
%% 400 tocaka oko (3,-3)
v(1,601:1000) = 2.*rand(400,1) + 2;
v(2,601:1000) = -2.*rand(400,1) - 2; 

figure(1) % stanje točaka kako bi ih trebalo klasterirati 
plot (v(1,:),v(2,:),'*b');
xlim([-2,6]); ylim([-5,6]); grid on

n = 1000;
m = 2;
k = 3;
pi = randi(k, 1, n); % pomijesane tocke
figure(2) % kako smo na početku klasterirali točke
plot(pi);

[Q, pi1] = means ( v, m, n, pi, k );

pi1
figure(3) % kakav je rezultat klasteriranja, step-fija
plot(pi1);

