function [m,n] = maze_newxy_from_xy (direction,x,y)
    %direction north=1, east=2, south=3, west=4
    if(direction==1)
        m=x;
        n=y-1;
    elseif(direction==2)
        m=x+1;
        n=y;
    elseif(direction==3)
        m=x;
        n=y+1;
    elseif(direction==4)
        m=x-1;
        n=y;
    end
end