function A = make_true_PSF(Pp,lt,dt,lm,la,a0,yl)

lp = size(Pp,1);
xl = mean(Pp(:,2)); zl = mean(Pp(:,3));
pl = [yl,xl,zl];

A = zeros(size(Pp,1),lt);

for i = 1:lp
    
    p = Pp(i,:);
    hi = pointsource_scattering(lm,la,dt,lt,p,pl,a0);
    A(i,:) = hi;
    
end

A = reshape(A,[round(sqrt(lp)),round(sqrt(lp)),lt]);
