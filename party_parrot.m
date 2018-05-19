parrot_name = 'party_parrot.gif';
filename = 'satya.png';
inter_gif_out = 'satya.gif';
output_gif = 'satya_parrot.gif';
load('centers.mat');

num_colors = 256;
n_size = [65, 65];


[pp, cm] = imread(parrot_name);
num_imgs = size(pp, 4);

[parrot, colormap] = imread(parrot_name);
satya = imresize(imread(filename), n_size);
[satya_bmp, map] = rgb2ind(satya, colormap);
imwrite(satya_bmp, colormap, inter_gif_out);

%%
satya = satya_bmp;
overlay_size = size(satya);
overlay_center = round(overlay_size / 2);
top_lefts = round(centers - overlay_center);

l = overlay_size(1);
for i = 1:num_imgs
    tlx = top_lefts(i, 1);
    tly = top_lefts(i, 2);
    
    indx = tlx:(tlx + l - 1);
    indy = tly:(tly + l - 1);
   
    pp(indy, indx, 1, i) = satya;
end

imwrite(pp, cm, output_gif, 'DelayTime', .05, 'LoopCount',Inf);







