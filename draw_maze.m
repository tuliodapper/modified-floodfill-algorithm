% draw_maze(maze)
% By Jeremy Kubica, Copyright 2003
%
% Displays the maze.
%   label_cells - A Boolean variable indicating whether to label
%                 the cells.  0 = Don't Label, 1 = Label (Default = 0)
% Type 'help maze' for more information
function draw_maze(maze,label_cells,X,Y,array,wall_array)

if nargin < 2
   label_cells = 0;
end

h1 = figure(1);
set(h1,'DoubleBuffer','on')

%hold off;
%clf;
%hold on;
clf;
hold on;

% determine the size of the maze and set the figure accordingly
R = maze.R;
C = maze.C;
axis([0 C 0 R+2]);

% draw the grid
text(X-0.8,(R-Y+2.5),'#');
ind = 1;
for i = 1:C
   for j = 1:R
      
      % Label the cell if needed.
      if label_cells == 1
         %text(i-0.5,(R-j+2.5),num2str(ind));
         text(i-0.5,(R-j+2.5),num2str(array(i, j)));
      end
      
      % Draw the northern border
      HN = line([(i-1) (i)],[(R-j+3) (R-j+3)]);
      %[A1,A2] = maze_XY_from_index(maze, ind);
      [B1,B2] = maze_walls_from_xy(1,i,j);
      if(wall_array(B1,B2) == 1)
         set(HN,'Color',[0 0 0]);
         set(HN,'LineStyle','-');
      elseif(maze.adjacent(ind,1) == 1)
         set(HN,'Color',[0.6 0.6 0.6]);
         set(HN,'LineStyle',':');
      end
      
      % Draw the southern border
      HS = line([(i-1) (i)],[(R-j+2) (R-j+2)]);
      %[A1,A2] = maze_XY_from_index(maze, ind);
      [B1,B2] = maze_walls_from_xy(3,i,j);
      if(wall_array(B1,B2) == 1)
         set(HS,'Color',[0 0 0]);
         set(HS,'LineStyle','-');
      elseif(maze.adjacent(ind,3) == 1)
         set(HS,'Color',[0.6 0.6 0.6]);
         set(HS,'LineStyle',':');
      end
      
      % Draw the eastern border
      HE = line([(i) (i)],[(R-j+3) (R-j+2)]);
      %[A1,A2] = maze_XY_from_index(maze, ind);
      [B1,B2] = maze_walls_from_xy(2,i,j);
      if(wall_array(B1,B2) == 1)
         set(HE,'Color',[0 0 0]);
         set(HE,'LineStyle','-');
      elseif(maze.adjacent(ind,2) == 1)
         set(HE,'Color',[0.6 0.6 0.6]);
         set(HE,'LineStyle',':');
      end
      
      % Draw the western border
      HW = line([(i-1) (i-1)],[(R-j+3) (R-j+2)]);
      %[A1,A2] = maze_XY_from_index(maze, ind);
      [B1,B2] = maze_walls_from_xy(4,i,j);
      if(wall_array(B1,B2) == 1)
         set(HW,'Color',[0 0 0]);
         set(HW,'LineStyle','-');
      elseif(maze.adjacent(ind,4) == 1)
         set(HW,'Color',[0.6 0.6 0.6]);
         set(HW,'LineStyle',':');
      end
      
      ind = ind + 1;
   end
end

%hold off;