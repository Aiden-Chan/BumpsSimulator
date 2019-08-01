classdef Boat < handle
   % class for boat information storage
   
   properties
       College; % String of college name
       Speed; % Double, boat speed
       Position; % Row matrix containing positions on each day e.g. [1 1 2 2]
   end
   
   methods
       function boat = Boat(app, index)
           % Initialise boat
           i = num2str(index);
           
           boat.College = app.(['College_' i]).Value;
           boat.Speed = app.(['Speed_' i]).Value;
           boat.Position = index;
       end
   end
end