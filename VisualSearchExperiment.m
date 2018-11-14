function VSData = VisualSearchExperiment (filename)

% This function outputs the results of a visual search experiment to VSData.
% VSData is a structure where VSData.Subject is a string containing the
%       name of the subject.
% VSData.DateTime is a string containing the date and time the experiment
%       is conducted, and
% VSdata.Observations is a 100-by-5 array containing 100 observations,
%       each observation recording the following information for one trial:
%       DisplayType, TargetPresent, N_Distract, TargetSeen, ResponseTime
% This function also outputs VSData into an excel file with the file path
% as the filename input.
%
% In this visual search experiment, there are 100 trials. Half are feature trials
% and the other half are conjunction trials. 
% Within each type, half have the target present and half have the target
% absent. 
% For each type and target present/absent, there are 5 trials with the
% following number of distractors: 6, 16, 26, 36, 46. 
%
% Author: Vanessa Nguyen & Candy Shim         Last Update: November 6, 2018
%
% Prompt the subject to enter their name.

Subject = GetSubjectName;
[hfig, hax] = SetUpFig;
VSInstructions(hax);

% Initialize each treatment.

Treatments = SetUpTreatments;
Observations = zeros(100,5);

% Pick treatments randomly and run them in order to get user response. 
for k=1:100
    % Set experimental factors
    Observations(k,1:3) = Treatments(k,:);
    DisplayType = Treatments(k,1);
    TargetPresent = Treatments(k,2);
    N_Distract = Treatments(k,3);
    [hrt_T,hyd_T,hyt_T] = SetUpTemplates(hax);  % Make template shapes
    if DisplayType==0       % Do Feature Search Trial
        [TargetSeen,ResponseTime] = FeatureSearchTrial(N_Distract, TargetPresent, hfig, hax, hrt_T, hyd_T, hyt_T);
        Observations(k,4) = TargetSeen;
        Observations(k,5) = ResponseTime;
    else                    % Do Conjunction Search Trial
        [TargetSeen,ResponseTime] = ConjunctionSearchTrial(N_Distract, TargetPresent, hfig, hax, hrt_T, hyd_T, hyt_T);
        Observations(k,4) = TargetSeen;
        Observations(k,5) = ResponseTime;
    end 
    CleanSlate(hax);        % Blank the display
    text(4.87, 5, '+', 'Color', 'white', 'FontSize', 50);   % Put a fixation cross
    pause(1);               % Keep the cross for 1 second.
    CleanSlate(hax);
end 
        
% Output results.
DateTime = datestr(clock);
VSData = struct('Subject', Subject, 'DateTime', DateTime, 'Observations', Observations);
CleanSlate(hax); 
text(2, 7, 'You have finished the test!', 'Color', 'white', 'FontSize', 18);
text(2, 7, 'Please wait as your results are being inputted into an excel sheet.', 'Color', 'white', 'FontSize', 18);
VSXLOut(VSData, filename);
delete(hfig);

end