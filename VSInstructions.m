function VSInstructions(hax)
% This function displays the instructions on the visual search window and
% clears the window of the instructions once someone clicks on a button.
%
% Author: Vanessa Nguyen & Candy Shim         Last Update: November 6,2018

% Initializing instruction message
line_3 = "Instructions";
line_8 = "A fixation dot will appear in the middle of the window. Stare at it. A short time later (less";
line_9 = "than a second), triangles and diamonds of various colors will appear on the screen. Your ";
line_10 = "task is to determine if there is a yellow triangle among the shapes. When you see a ";
line_11 = "yellow triange, press the / key on your keyboard as quickly as possible. When you ";
line_12 = "are certain there is not a yellow triangle in the window, press the z key";
line_14 = " on your keyboard, again as quickly as possible. After pressing the z or / key, ";
line_16 = "press the space bar to start the next trial. The feature and conjunctive trials ";
line_17 = 'consist of approximately 50 trials each. If you make a mistake (e.g., say "Present"';
line_18 = ' when you should have said "Absent"), that trial is repeated later in the experiment,';
line_20 = " so you may actually run more than 50 trials. You can also discard a trial by pressing ";
line_21 = "the t key instead of z or /. Discarding is appropriate if, after starting a trial,";
line_22 = " you sneeze, zone out, or are otherwise distracted. Discarded trials will be repeated";
line_23 = " later. In every trial, your goal is simply to determine if a yellow triangle is present.";
line_25 = " If it is press /, if it is not press z. If you are frequently incorrect (feedback";
line_26 = " is given when you are incorrect), try to delay your response until you are more certain";
line_27 = " that you are correct. At the end of the experiment, the experiment window will close and ";
line_30 = "a plot (if appropriate) and provides an explanation of the a new window will appear that displays";
line_31 = "experiment and results. Press any key when you are ready to begin.";

% Displaying message in window
text(0, 0, line_31, 'Color', 'white', 'FontSize', 18);
text(0, 0.5, line_30, 'Color', 'white', 'FontSize', 18);
text(0, 1.0, line_27, 'Color', 'white', 'FontSize', 18);
text(0, 1.5, line_26, 'Color', 'white', 'FontSize', 18);
text(0, 2, line_25, 'Color', 'white', 'FontSize', 18);
text(0, 2.5, line_23, 'Color', 'white', 'FontSize', 18);
text(0, 3, line_22, 'Color', 'white', 'FontSize', 18);
text(0, 3.5, line_21, 'Color', 'white', 'FontSize', 18);
text(0, 4, line_20, 'Color', 'white', 'FontSize', 18);
text(0, 4.5, line_18, 'Color', 'white', 'FontSize', 18);
text(0, 5, line_17, 'Color', 'white', 'FontSize', 18);
text(0, 5.5, line_16, 'Color', 'white', 'FontSize', 18);
text(0, 6, line_14, 'Color', 'white', 'FontSize', 18);
text(0, 6.5, line_12, 'Color', 'white', 'FontSize', 18);
text(0, 7, line_11, 'Color', 'white', 'FontSize', 18);
text(0, 7.5, line_10, 'Color', 'white', 'FontSize', 18);
text(0, 8, line_9, 'Color', 'white', 'FontSize', 18);
text(0, 8.5, line_8, 'Color', 'white', 'FontSize', 18);
text(0, 9, line_3, 'Color', 'white', 'FontSize', 18);

% Clears window once a button is pressed
waitforbuttonpress;
CleanSlate(hax);        % Blank the display
text(4.87, 5, '+', 'Color', 'white', 'FontSize', 50);   % Put a fixation cross
pause(1);               % Keep the cross for 1 second.
CleanSlate(hax);
end