function B = pad_3D(A,py,px,pz)

B = zeros(size(A,1)+2*py,size(A,2)+2*px,size(A,3)+2*pz);
B(py+1:py+size(A,1),px+1:px+size(A,2),pz+1:pz+size(A,3)) = A;