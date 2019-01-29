function [m,n] = maze_walls_from_xy(direction,x,y)
    %direction north=1, east=2, south=3, west=4
    if((direction==1) || (direction==2))
        n=2*(y-1)+1;
    else
        n=2*(y-1)+2;
    end
    if((direction==1) || (direction==3))
        m=2*(x-1)+1;
    else
        m=2*(x-1)+2;
    end
end