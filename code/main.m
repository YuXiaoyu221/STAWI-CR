clc; clear; close all;

options.scales = [0.25, 0.5, 1.0]; 
% options.scales = [1.0]; 
options.lambda_ratio = 0.001;
options.sigma2_ratio = 0.5;   
options.sigma1 = 10.0; 

str_path=['.\data\1\'];
tif_ext='.tif';
nI=5;
for i=1:nI
    Multi_Mask(:,:,i)=imread([str_path,'I',num2str(i),'_mask',tif_ext]);
    Multi_Data(:,:,:,i)=imread([str_path,'I',num2str(i),'_cloud',tif_ext]);
    Multi_Data00(:,:,:,i)=imread([str_path,'I',num2str(i),'_OriginalCloudFree',tif_ext]);
end

tic
Multidata_out = MultiScale_Isophote_Reconstruction(Multi_Data, Multi_Mask, options);
et=(toc/60)

for i=1:nI
    imwrite(Multidata_out(:,:,:,i),[str_path,'\result\','I',num2str(i),'_STAWI',tif_ext]);
end