function Phi = pointsource_scattering(lm,la,dt,tbin,p,pl,a0)

c = 3*10^8;

% lm = lm/dx;
mu_s = 1/lm;
% la = la/dx;
mu_a = 1/la;
t1 = dt*((1:tbin)-a0);
t1(t1==0)=0.1*dt;

D = 1./(3*(mu_s+mu_a));

f0 = (c)./((4*pi*D*c)^(3/2));
ns1 = ((p(2)-pl(2)).^2+(p(1)-pl(1)).^2+(p(3)-pl(3)).^2);
phi = exp(-(ns1./(4*D*c*(t1))));
phi1 = ((t1)).^(-3/2);
phi2 = exp(-mu_a*c*t1);

Phi = f0.*phi.*phi1.*phi2;
Phi(t1<0) = 0;
% Phi = Phi./sum(Phi(:));