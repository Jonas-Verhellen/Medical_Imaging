function [ chi_squared , maximum_diff , correlation] = Image_Diff( image_1 , image_2 )
%Image_Diff !goal should be second image! chi_squared is calculated with
% sigma =1 , chi_squared should be minimized and R should be close to one
image_1_1D = From2Dto1D(image_1);
image_2_1D = From2Dto1D(image_2);
diff2 = (image_1_1D - image_2_1D).^2;
diff_from_mean = image_1_1D - mean(image_1_1D);
maximum_diff = max(sqrt(diff2));
chi_squared = sum(diff2); % sigma = 1
correlation = corr2(image_1,image_2);
%normalized histograms
% hn1 = imhist(image_1)./numel(image_1);
% hn2 = imhist(image_2)./numel(image_2);
% f = sum((hn1 - hn2).^2);
end

