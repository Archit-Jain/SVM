function [textmat] = GLCMfeatures(immat)
%cooccurence matrix for all angles  0 90 180 270

[m, n] = size(immat);
a = immat;
g = 256;

%constuct cooccurence matrix

%co for 0 deg
for i=1:m,
    for j=1:(n),
        x=a(i,j);
        y=a(i,(j+1));
        if(x==0)
            x=1;
        end
        b1(x,y)=b1(x,y)+1;
    end
end

%co for 45 deg */
for i=1:m,
    for j=1:(n),
        x=a(i,(j+1));
        y=a(i,j);
        % zero indices cannot be handled in matlab.
        % assume 1 instead 0 with certain loss of accuracy
        if(x==0)
            x=1;
        end
        b3(x,y)=b3(x,y)+1;
    end
end

%co for 90 deg
for j=1:n,
    for i=1:(m),
        x=a((i+1),j);
        y=a(i,j);
        if(x==0)
            x=1;
        end
        b2(x,y)=b2(x,y)+1;
    end
end

% co  for  135 deg
for j=1:n,
    for i=1:(m),
        x=a(i,j);
        y=a((i+1),j);
        if(x==0)
            x=1;
        end
        b4(x,y)=b4(x,y)+1;
    end
end

bmean=(b1+b2+b3+b4)/4;
p=(bmean);
p=p/(m*n);

%mean of Glcm')
GMean=mean2(bmean);

%standard  deviation of glcm')
GStd=std2(bmean);

%variance of glcm
GVar=GStd*GStd;

%range of Glcm
GRange=max(max(p))-min(min(p));


% g----No of gray levels

% Texture features-------------------------------------------------

for i=1:g,
    for j=1:g
        Energy=Energy+p(i,j)*p(i,j);
        %Entropy=p(i,j)*log2(p(i,j));
        Contrast=Contrast+abs(i-j)*p(i,j);
        if(i~=j)
            Idm=Idm+p(i,j)/(abs(i-j));
        end
    end
end

Maxprob = max(max(p));

% store all features in vector textmat and return it to main program
textmat = [GMean, GVar, GRange, Energy, Maxprob];

% textmat = premnmx(textmat);

