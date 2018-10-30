function [TargetSeen, ResponseTime] = FeatureSearchTrial(N_Distract,TargetPresent)

% This function creates a display with N_Distract red distractor triangles
% in random locations on a blue blackground with invisible axes scaled from 
% 0 to 10. 
% TargetSeen is a logical variable that is TRUE if the subject saw the
% target. 
% ResponseTime is the rsponse time.
% N_Distract is the number of distractors present in the display.
% TargetPresent is a logical variable that is TRUE if the target is actually 
% in the display. If TargetPresent is TRUE, it creates a yellow target 
% triangle at a random location in the display

% Author:  Vanessa Nguyen & Candy Shim       Last Update: October 23, 2018

% Set up the figure and triangle template. 
[ hfig, hax ]= SetUpFig( );
[ hrt ] = RedTriangle(hax);
% Make N_Distract copies of the distractor triangle and place them at random
% integer coordinates within the figure.
HandleArray = zeros(1, N_Distract);
for k=1:N_Distract
    overlap = true;
    while overlap
        DeltaX = randi([0 9]);
        DeltaY = randi([0 9]);
        overlap = false;
        for i = HandleArray
            if i
                x = get(i, 'XData');
                y = get(i, 'YData');
                if (x(1) == DeltaX) && (y(1) == DeltaY)
                    overlap = true;
                    break
                end
            else
                break
            end
        end
    end
    
    newTriangle = CopyMovePatch(hrt, hax, DeltaX, DeltaY);
    HandleArray(k) = newTriangle;
end
% If TargetPresent == true, change the color of the triangle template to
% yellow, and then move it to a random integer coordinate within the figure.
% Otherwise, make the triangle template invisible.
if TargetPresent == true
    set(hrt, 'FaceColor', [1 1 0]);
    overlap = true;
    while overlap
        DeltaX = randi([0 9]);
        DeltaY = randi([0 9]);
        overlap = false;
        for i = HandleArray
            if i
                x = get(i, 'XData');
                y = get(i, 'YData');
                if (x(1) == DeltaX) && (y(1) == DeltaY)
                    overlap = true;
                    break
                end
            else
                break
            end
        end
    end
else
    set(hrt, 'Visible','off');
    MovePatch(hrt, DeltaX, DeltaY);
   
% Record the response and response time. 
[TargetSeen,ResponseTime] = GetResponse(hfig);
end
