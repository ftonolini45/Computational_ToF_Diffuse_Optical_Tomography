function tv = TV_norm(X)

[dX,dY] = gradient(X);
dM = sqrt(dX.^2+dY.^2);
tv = sum(dM(:));
