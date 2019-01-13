function B = convolve_2D(A,M)

B = conv2(A,M);
B = B(round(size(B,1)/2)-round(size(A,1)/2)+1:round(size(B,1)/2)-round(size(A,1)/2)+size(A,1),round(size(B,2)/2)-round(size(A,2)/2)+1:round(size(B,2)/2)-round(size(A,2)/2)+size(A,2));