function Treatments = SetUpTreatments()
% This function outputs an array of the different treatments in randomized
% order.
%
% Author: Vanessa Nguyen & Candy Shim         Last Update: November 6,2018

% Initializing each treatment
Block = [ 
    0, 0, 6;
    0, 0, 16;
    0, 0, 26;
    0, 0, 36;
    0, 0, 46;
    0, 1, 6;
    0, 1, 16;
    0, 1, 26;
    0, 1, 36;
    0, 1, 46;
    1, 0, 6;
    1, 0, 16;
    1, 0, 26;
    1, 0, 36;
    1, 0, 46;
    1, 1, 6;
    1, 1, 16;
    1, 1, 26;
    1, 1, 36;
    1, 1, 46;
    ];

% Create a new array with 5 copies of each treatment
Treatments = repmat(Block,[5,1]);

% Randomize treatment array
Treatments = Treatments(randperm(100),:);
end
    