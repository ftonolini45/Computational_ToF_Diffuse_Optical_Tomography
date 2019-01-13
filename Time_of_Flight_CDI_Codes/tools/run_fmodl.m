function B = run_fmodl(A,PSFf,a0)

py = round((size(PSFf,1)-size(A,1))/2);
px = round((size(PSFf,2)-size(A,2))/2);
pz = round((size(PSFf,3)-size(A,3))/2);

A = pad_3D(A,py,px,pz);
Af = fftn(A);

Bf = PSFf.*Af;
B = ifftn(Bf);

if nargin == 3 && a0 > 0
    
    B = extract_3D(B,py,px,0);
    B = B(:,:,1+pz-a0:size(B,3)-a0-pz);
    
elseif nargin == 3 && a0 < 0
    
    B = extract_3D(B,py,px,0);
    a0 = -a0;
    B = B(:,:,pz+a0+1:size(B,3)-pz+a0);

else
    
    B = extract_3D(B,py,px,pz);
    
end