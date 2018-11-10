%% This file is for saving the sequenced model for the Project
% we first read the image -->divide it into blocks--> apply DCT for each
% block -->QUANTIZE THEM-->zigzag scan the QDCTs-->encode the stream
% vector-->huffman encode them by huffman dict which needs at first to find
% probabilities-->huffman decode the last vector-->runlength decode
% it-->recnstruct the matrix -->unnormalize the coefficients -->IDCT them
% -->reconstruct the image
Image_pixels = double(imread('C:\Users\pc\Desktop\Fall 2018\Information Theory and Coding\JPEG Assignment\Einstein.jpg','jpeg')); 
 dividedimg = Divide_Image(Image_pixels);
 reconstructedimage1 = cell(42,42);
 for i = 1:42
     for j = 1:42
        y = cell2mat(dividedimg(i,j));
        D = DCT(y);
        y = uint8(y);
        u = Norm_DCT(D,2);
        e = Zigzag_scan(u);
        n = Runlength(e);
        [s,prob] = probabilities(n);
        [dict,avglen] = huffmandict(s,prob);
        comp = huffmanenco(n,dict);
        dsig = huffmandeco(comp,dict);
        t = Runlengthdecode(dsig);
        p = Inversezigzag(t,8,8);
        l = Unnormalize(p,2);
        O = IDCT(l);
        reconstructedimage1{i,j} = O;
     end
 end
 reconstructedimg1 = uint8(cell2mat(reconstructedimage1));
 subplot(3,1,1)
 imshow(imresize(uint8(Image_pixels),55))
 %O = uint8(O);
 subplot(3,1,2)
 imshow(imresize(reconstructedimg1,55))
 imwrite(reconstructedimg1, 'C:\Users\pc\Desktop\Fall 2018\Information Theory and Coding\JPEG Assignment\Compressed_Image1.jpg','jpeg');
 subplot(3,1,3)
 %% 
 reconstructedimage2 = cell(42,42);
 for i = 1:42
     for j = 1:42
        y = cell2mat(dividedimg(i,j));
        D = DCT(y);
        y = uint8(y);
        u = Norm_DCT(D,1);
        e = Zigzag_scan(u);
        n = Runlength(e);
        [s,prob] = probabilities(n);
        [dict,avglen] = huffmandict(s,prob);
        comp = huffmanenco(n,dict);
        dsig = huffmandeco(comp,dict);
        t = Runlengthdecode(dsig);
        p = Inversezigzag(t,8,8);
        l = Unnormalize(p,1);
        O = IDCT(l);
        reconstructedimage2{i,j} = O;
     end
 end
 reconstructedimg2 = uint8(cell2mat(reconstructedimage2));
 imshow(reconstructedimg2)
 imwrite(reconstructedimg2, 'C:\Users\pc\Desktop\Fall 2018\Information Theory and Coding\JPEG Assignment\Compressed_Image2.jpg','jpeg');