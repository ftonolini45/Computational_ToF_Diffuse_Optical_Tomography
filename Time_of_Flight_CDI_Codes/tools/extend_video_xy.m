function Ve = extend_video_xy(V,d,el)

Ve = zeros(size(V,1)+2*d,size(V,2)+2*d,size(V,3));

for i = 1:size(V,3)
    
    Vi = V(:,:,i);
    Vei = extend_image(Vi,d,el);
    Ve(:,:,i) = Vei;
    
end