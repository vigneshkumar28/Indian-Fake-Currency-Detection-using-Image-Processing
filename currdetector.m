clear;
I100=imread('Rs100.jpeg'); %Training image for 100 Rs currency
I500=imread('Rs500.jpeg'); %Training image for 500 Rs currency
I50 = imread('Rs50.jpeg'); %Training image for 50 Rs currency
I20 = imread('Rs20.jpeg'); %Training image for 20 Rs currency
I10 = imread('Rs10.jpeg'); %Training image for 10 Rs currency
I2k = imread('Rs2000.jpg'); %Training image for 2000 Rs currency


subplot(2,2,1), imshow(I100)
subplot(2,2,2), imshow(I500)
subplot(2,2,3), imshow(I50)
subplot(2,2,4), imshow(I20)
figure;
subplot(1,2,1), imshow(I10)
subplot(1,2,2), imshow(I2k)
Test_image=imread(input('Enter the image in single quotes : ')); %Input image

%Below mean of RGB components of training image and testing image is
%calculated

% Mean of RGB components of 500 Rs
a=imresize(I500,[150,400]); %Input image is resized here
a1=a(:,:,1); %Red component
a2=mean2(a1); %Mean of Red component
a3=a(:,:,2); %Green component
a4=mean2(a3); %Mean of Green component
a5=a(:,:,3); %Blue component
a6=mean2(a5); %Mean of Blue component
imshow(a1);
% Mean of RGB components of 100 Rs
b=imresize(I100,[150,400]);
b1=b(:,:,1); %Red component
b2=mean2(b1); %Mean of Red component
b3=b(:,:,2); %Green component
b4=mean2(b3); %Mean of Green component
b5=b(:,:,3); %Blue component
b6=mean2(b5); %Mean of Blue component

% Mean of RGB components of 50 Rs
c=imresize(I50,[150,400]);
c1=c(:,:,1);
c2=mean2(c1);
c3=c(:,:,2);
c4=mean2(c3);
c5=c(:,:,3);
c6=mean2(c5);

% Mean of RGB components of 20 Rs
d=imresize(I20,[150,400]);
d1=d(:,:,1);
d2=mean2(d1);
d3=d(:,:,2);
d4=mean2(d3);
d5=d(:,:,3);
d6=mean2(d5);

% Mean of RGB components of 10 Rs
e=imresize(I10,[150,400]);
e1=e(:,:,1);
e2=mean2(e1);
e3=e(:,:,2);
e4=mean2(e3);
e5=e(:,:,3);
e6=mean2(e5);

% Mean of RGB components of 2000 Rs
f=imresize(I2k,[150,400]);
f1=f(:,:,1);
f2=mean2(f1);
f3=f(:,:,2);
f4=mean2(f3);
f5=f(:,:,3);
f6=mean2(f5);


%Training image
I=imresize(Test_image,[150,400]);
I1=I(:,:,1);
I2=mean2(I1);
I3=I(:,:,2);
I4=mean2(I3);
I5=I(:,:,3);
I6=mean2(I5);

%disp(abs(a2-I2))
%disp(abs(a4-I4))
%disp(abs(a6-I6))


%Checking difference between the mean value of RGB components of training
%image and input image and if the difference is less than the threshold
%then we are checking another condition 

%Below we are checking if the input image is 500Rs currency
if(abs(a2-I2) < 5 && abs(a4-I4) < 5 && abs(a6-I6) < 5)
    a7=rgb2gray(a);
    I7=rgb2gray(I);
    a8=edge(a7,'canny'); %canny edge detector is applied for edge detection
    I8=edge(I7,'canny');
    se=[1,1];
    a8=imclose(a8,se);
    I8=imclose(I8,se);
    
    %In below for loop we are segementing the numeric part of the image
    for i=1:150
        for j=1:400
            if(i>50 && i<82 && j>150 && j<228 )
                a8(i,j)=a8(i,j);
                I8(i,j)=I8(i,j);
            else
                I8(i,j)=0;
                a8(i,j)=0;
            end
        end
    end
    imwrite(a8,'new1.jpg')
    imshow(a8)
    a8=imclose(a8,se);
    I8=imclose(I8,se);
    
    % In below if condition nnz function gives number of non zero values in
    % the image. We are comparing the number of non zero values of training
    % image(500.jpg) with input image and if the difference is less than certain
    % threshold value then we conclude that it is 500 Rs 
    if((abs(nnz(a8)-nnz(I8))<=100) && (nnz(I8)>=250) && (nnz(I8)<370))
        fprintf('Rs : 500\n');
    else
        fprintf('Currency not recognized\n');
    end
    
%Below we are checking if the input image is 100Rs currency    
elseif (abs(b2-I2) < 5 && abs(b4-I4) < 5 && abs(b6-I6) < 5)
    b7=rgb2gray(b);
    I7=rgb2gray(I);
    b8=edge(b7,'canny');
    I8=edge(I7,'canny');
    se=[1,1];
    b8=imclose(b8,se);
    I8=imclose(I8,se);
    for i=1:150
        for j=1:400
            if(i>49 && i<82 && j>150 && j<227 )
                b8(i,j)=b8(i,j);
                I8(i,j)=I8(i,j);
            else
                I8(i,j)=0;
                b8(i,j)=0;
            end
        end
    end
    
    % In below if condition nnz function gives number of non zero values in
    % the image. We are comparing the number of non zero values of training
    % image(hundered2.jpg) with input image and if the difference is less than certain
    % threshold value then we conclude that it is 100 Rs 

    if((abs(nnz(b8)-nnz(I8))<=180) && (nnz(I8)>420) && (nnz(I8)<600) )
        disp('Rs : 100');
    else
        fprintf('Currency not recognized\n');
    end    

%Below we are checking if the input image is 50 Rs currency    
elseif(abs(c2-I2) < 10 && abs(c4-I4) < 10 && abs(c6-I6) < 10)
    
    c7=rgb2gray(c);
    I7=rgb2gray(I);
    c8=edge(c7,'canny');
    I8=edge(I7,'canny');
    se=[1,1];
    c8=imclose(c8,se);
    I8=imclose(I8,se);
    for i=1:150
        for j=1:400
            if(i>50 && i<88 && j>170 && j<237 )
                c8(i,j)=c8(i,j);
                I8(i,j)=I8(i,j);
            else
                I8(i,j)=0;
                c8(i,j)=0;
            end
        end
    end
    %imwrite(I8,'new.jpg')
    %c8=imclose(c8,se);
    %I8=imclose(I8,se);
	%disp(abs(nnz(c8)-nnz(I8)))
	%disp(nnz(I8))
	%disp(nnz(c8))
    
    % In below if condition nnz function gives number of non zero values in
    % the image. We are comparing the number of non zero values of training
    % image(50_4.jpg) with input image and if the difference is less than certain
    % threshold value then we conclude that it is 50 Rs 
	
    if((abs(nnz(c8)-nnz(I8))<=50) && (nnz(I8)>=330) && (nnz(I8)<450))
       fprintf('Rs : 50\n');
    else
        fprintf('Currency not recognized\n');
    end
    
%Below we are checking if the input image is 20Rs currency    
elseif(abs(d2-I2) < 14 && abs(d4-I4) < 14 && abs(d6-I6) < 14)
    d7=rgb2gray(d);
    I7=rgb2gray(I);
    d8=edge(d7,'canny');
    I8=edge(I7,'canny');
    se=[1,1];
    d8=imclose(d8,se);
    I8=imclose(I8,se);
    for i=1:150
        for j=1:400
            if(i>50 && i<88 && j>160 && j<225 )
                d8(i,j)=d8(i,j);
                I8(i,j)=I8(i,j);
            else
                I8(i,j)=0;
                d8(i,j)=0;
            end
        end
    end
    imwrite(d8,'new.jpg')
    c8=imclose(d8,se);
    I8=imclose(I8,se);
	%disp(abs(nnz(d8)-nnz(I8)))
	%disp(nnz(I8))
	%disp(nnz(c8))

    % In below if condition nnz function gives number of non zero values in
    % the image. We are comparing the number of non zero values of training
    % image(20_3.jpg) with input image and if the difference is less than certain
    % threshold value then we conclude that it is 20 Rs 

    if((abs(nnz(c8)-nnz(I8))<=100) && (nnz(I8)>=300) && (nnz(I8)<450))
       fprintf('Rs : 20\n');
    else
        fprintf('Currency not recognized\n');
    end
    
%Below we are checking if the input image is 10Rs currency    
elseif(abs(e2-I2) < 10 && abs(e4-I4) < 10 && abs(e6-I6) < 10)
    
    c7=rgb2gray(e);
    I7=rgb2gray(I);
    c8=edge(c7,'canny');
    I8=edge(I7,'canny');
    se=[1,1];
    c8=imclose(c8,se);
    I8=imclose(I8,se);
    for i=1:150
        for j=1:400
            if(i>50 && i<88 && j>177 && j<226 )
                c8(i,j)=c8(i,j);
                I8(i,j)=I8(i,j);
            else
                I8(i,j)=0;
                c8(i,j)=0;
            end
        end
    end
    %imwrite(I8,'new.jpg')
    c8=imclose(c8,se);
    I8=imclose(I8,se);
	%disp(abs(nnz(c8)-nnz(I8)))
	%disp(nnz(I8))
	%disp(nnz(c8))

    % In below if condition nnz function gives number of non zero values in
    % the image. We are comparing the number of non zero values of training
    % image(10.jpg) with input image and if the difference is less than certain
    % threshold value then we conclude that it is 10 Rs 
	
    if((abs(nnz(c8)-nnz(I8))<=100) && (nnz(I8)>=250) && (nnz(I8)<350))
       fprintf('Rs : 10\n');
    else
        fprintf('Currency not recognized\n');
    end
    
%Below we are checking if the input image is 2000Rs currency    
elseif(abs(f2-I2) < 35 && abs(f4-I4) < 35 && abs(f6-I6) < 35)
    
    c7=rgb2gray(f);
    I7=rgb2gray(I);
    c8=edge(c7,'canny');
    I8=edge(I7,'canny');
    se=[1,1];
    c8=imclose(c8,se);
    I8=imclose(I8,se);
    for i=1:150
        for j=1:400
            if(i>90 && i<130 && j>290 && j<360 )
                c8(i,j)=c8(i,j);
                I8(i,j)=I8(i,j);
            else
                I8(i,j)=0;
                c8(i,j)=0;
            end
        end
    end
    %imwrite(I8,'new.jpg')
    c8=imclose(c8,se);
    I8=imclose(I8,se);
	%disp(abs(nnz(c8)-nnz(I8)))
	%disp(nnz(I8))
	%disp(nnz(c8))

    % In below if condition nnz function gives number of non zero values in
    % the image. We are comparing the number of non zero values of training
    % image(2000_1.jpg) with input image and if the difference is less than certain
    % threshold value then we conclude that it is 2000 Rs 
	
    if((abs(nnz(c8)-nnz(I8))<=200) && (nnz(I8)>=150) && (nnz(I8)<400))
       fprintf('Rs : 2000\n');
    else
        fprintf('Currency not recognized\n');
    end    
    
else
    disp('Currency unrecoginised');
end
