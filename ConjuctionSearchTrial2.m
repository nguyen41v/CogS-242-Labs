function [TargetSeen, ResponseTime] = ConjuctionSearchTrial2(N_Distract,TargetPresent)

% This function creates a display with N_Distract/2 red distractor
% triangles and N_Distract/2 yellow distractor diamonds if N_Distract is even, 
% else, it will create (N_Distract-1)/2 red distractor
% triangles and yellow distractor diamonds with randomly picking one to have 
% the extra. These shapes will be in random locations on a blue blackground 
% with invisible axes scaled from 0 to 10. 
% TargetSeen is a logical variable that is TRUE if the subject saw the
% target. 
% ResponseTime is the response time.
% N_Distract is the number of distractors present in the display.
% TargetPresent is a logical variable that is TRUE if the target is actually 
% in the display. If TargetPresent is TRUE, it creates a yellow target 
% triangle at a random location in the display

% Author:  Vanessa Nguyen & Candy Shim       Last Update: October 30, 2018

% Set up the figure, triangle, and diamond template. 
[ hfig, hax ]= SetUpFig( );
[ hrt ] = RedTriangle(hax);
[ hrtd ] = YellowDiamond(hax);
% Make N_Distract copies of the distractor triangle and place them at random
% integer coordinates within the figure.
z=0;
Locations = zeros(100,2);
for x=0:9
    for y=0:9
        z = z + 1;
        Locations(z,:)=[x,y];
    end 
end

Select=randperm(100);


HandleArray = zeros(1, N_Distract);
if mod(N_Distract,2)== 1
    MakeShape = randi(2); 
    if MakeShape == 1
        newTriangle = CopyMovePatch(hrt, hax, Locations(Select(N_Distract),1), Locations(Select(N_Distract),2));
        HandleArray(N_Distract) = newTriangle;
    else
        newDiamond = CopyMovePatch(hrtd, hax, Locations(Select(N_Distract),1), Locations(Select(N_Distract),2));
        HandleArray(N_Distract) = newDiamond;
    end
end 
for k=1:N_Distract-1
        DeltaX = Locations(Select(k),1);
        DeltaY = Locations(Select(k),2);
        if mod(k,2)== 1
            newTriangle = CopyMovePatch(hrt, hax, DeltaX, DeltaY);
            HandleArray(k) = newTriangle;
        else
            newDiamond = CopyMovePatch(hrtd, hax, DeltaX, DeltaY);
            HandleArray(k) = newDiamond;
        end
end
set(hrtd, 'Visible','off');
% If TargetPresent == true, change the color of the triangle template to
% yellow, and then move it to a random integer coordinate within the figure.
% Otherwise, make the triangle template invisible.
if TargetPresent == true
    set(hrt, 'FaceColor', [1 1 0]);
    DeltaX = Locations(Select(N_Distract+1),1);
    DeltaY = Locations(Select(N_Distract+1),2);
    MovePatch(hrt, DeltaX, DeltaY);
else
    set(hrt, 'Visible','off');
    
end    
% Record the response and response time. 
[TargetSeen,ResponseTime] = GetResponse(hfig);
end
