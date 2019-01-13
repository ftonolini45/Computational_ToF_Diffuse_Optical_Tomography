function Ie = extend_image(I,d,el)

G = make_2D_gaussian(size(I,1),size(I,2),1,1,[size(I,1)/2,size(I,2)/2],4);
G = G./sum(G(:));
cI  = convolve_2D(I,G);
[dIx,dIy] = gradient(cI);

tb = I(1,:); dtb = dIy(2,:);
Y1 = (1:d)'*ones(1,size(I,2));
Tb = ones(d,1)*tb; DTb = ones(d,1)*dtb;
Ex = exp(-Y1./el);
TB = Ex.*(Tb-DTb.*Y1); TB = flip(TB,1);

bb = I(size(I,1),:); dbb = dIy(size(I,1)-1,:);
Y1 = (1:d)'*ones(1,size(I,2));
Bb = ones(d,1)*bb; DBb = ones(d,1)*dbb;
Ex = exp(-Y1./el);
BB = Ex.*(Bb+DBb.*Y1);

Ie = [TB;I;BB];
Ieo = Ie;

G = make_2D_gaussian(size(Ieo,1),size(Ieo,2),1,1,[size(Ieo,1)/2,size(Ieo,2)/2],4);
G = G./sum(G(:));
cIo  = convolve_2D(Ieo,G);
[dIex,dIey] = gradient(cIo);

lb = Ie(:,1); dlb = dIex(:,2);
X1 = ones(size(Ie,1),1)*(1:d);
Lb = lb*ones(1,d); DLb = dlb*ones(1,d);
Ex = exp(-X1./el);
LB = Ex.*(Lb-DLb.*X1); LB = flip(LB,2);

Ie = [LB,Ie];

rb = Ieo(:,size(Ieo,2)); drb = dIex(:,size(Ieo,2)-1);
X1 = ones(size(Ieo,1),1)*(1:d);
Rb = rb*ones(1,d); DRb = drb*ones(1,d);
Ex = exp(-X1./el);
RB = Ex.*(Rb+DRb.*X1);

Ie = [Ie,RB];

Ie(Ie<0) = 0;