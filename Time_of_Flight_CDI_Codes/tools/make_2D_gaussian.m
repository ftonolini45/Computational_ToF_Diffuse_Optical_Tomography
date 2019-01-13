function G = make_2D_gaussian(ny,nx,dx,dy,x0,sigma)

X = dx*ones(ny,1)*(1:nx); X = X-x0(2);
Y = dy*(1:ny)'*ones(1,nx); Y = Y-x0(1);

G = exp(-((X.^2)+(Y.^2))./(2*sigma^2));