function Y=generateY(x,n,Delta,dim)
gap=ones(size(x))*(2*Delta)/n;
if dim==2
    [XX,YY]=meshgrid(x(1)-Delta:gap(1):x(1)+Delta,x(2)-Delta:gap(2):x(2)+Delta);
    Y=[XX(:) YY(:)];
elseif dim==3
    [XX,YY]=meshgrid(x(1)-Delta:gap(1):x(1)+Delta,x(2)-Delta:gap(2):x(2)+Delta);
    [ZZ]=meshgrid(x(3)-Delta:gap(3):x(3)+Delta);
    %% Added to manage precision problem
    sx=size(XX(:),1);
    sz=size(ZZ(:),1);
    if(sx~=sz)
        [mpo index]=min([sx sz]);
        if(index==1)
            ZZ=ZZ(1:size(XX,1),1:size(XX,2));
        else
            XX=XX(1:size(ZZ,1),1:size(ZZ,2));
            YY=YY(1:size(ZZ,1),1:size(ZZ,2));
        end
    end
    Y=[XX(:) YY(:) ZZ(:)];
elseif dim==4
    [XX,YY]=meshgrid(x(1)-Delta:gap(1):x(1)+Delta,x(2)-Delta:gap(2):x(2)+Delta);
    [ZZ,UU]=meshgrid(x(3)-Delta:gap(3):x(3)+Delta,x(4)-Delta:gap(4):x(4)+Delta);
    %% Added to manage precision problem
    sx=size(XX(:),1);
    sz=size(ZZ(:),1);
    if(sx~=sz)
        [mpo index]=min([sx sz]);
        if(index==1)
            ZZ=ZZ(1:size(XX,1),1:size(XX,2));
            UU=UU(1:size(XX,1),1:size(XX,2));
        else
            XX=XX(1:size(ZZ,1),1:size(ZZ,2));
            YY=YY(1:size(ZZ,1),1:size(ZZ,2));
        end
    end
    %% Create 4-d mesh
    Y=[XX(:) YY(:) ZZ(:) UU(:)];
end
end
