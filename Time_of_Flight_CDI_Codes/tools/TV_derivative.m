function tvd = TV_derivative(X)

[dX,dY] = gradient(X);
dM = sqrt(dX.^2+dY.^2);
dM(dM<0.05*max(dM(:))) = 0.05*max(dM(:));
dX = dX./dM; dY = dY./dM;
[dX2,~] = gradient(dX);
[~,dY2] = gradient(dY);
tvd = -(dX2+dY2);