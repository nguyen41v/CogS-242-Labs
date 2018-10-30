function d_prime = Reference_ROC()

% This function plots reference ROC curves that can be used to estimate
% the discriminability index by plotting a point with (P(False Alarm),P(Hit))
% coordinates.
% 
% The discriminabilty indices are incremented ...
%
% Author: Alan P. Knoerr              Last Update: October 30, 2018

%***************************%
%                           %
%  Initialize the ROC Plot  %
%                           %
%***************************%

% Initialize the ROC plot, and create a reference line with slope 1 for it
%(corresponding to d_prime = 0, meaning the signal present and absent
% conditions cannot be discriminated).

figure
reference_x = [0, 1];
reference_y = [0, 1];
plot(reference_x,reference_y) % The reference line is plotted in slate blue.
axis square
hold on
title('ROC Plot')
xlabel('Prob( False Alarm )')
ylabel('Prob( Hit )')

C = {'k','b','r','g','m'}; % Successive plotting colors:
                           % black, blue, red, green, magenta

%***************************************%
%                                       %
%  Calculate quantities to be plotted,  %
%  and plot the ROC curves.             %
%                                       %
%***************************************% 

% Determine the stimulus values at which to evaluate the noise densities.

absent_mean = 0;
max_signal_mean = 2.5;
std_dev = 1;

min_stim = absent_mean - 4*std_dev;        % Probability Theory
max_stim = max_signal_mean + 4*std_dev;    % (Chebyschev's Inequality)
increment = std_dev/10;                    % tells us nearly all the probability
x = min_stim:increment:max_stim;           % lies w/in 4 std_devs of the mean.             
 
% Evaluate the "absent" density at these stimulus values.

y_abs = normpdf(x,absent_mean,std_dev);

% Evaluate the "signal" densities at these stimulus values,
% and calculate d_prime in each case.
% Then calculate and plot level curves for d_prime
% in the ( P(False Alarm), P(Hit) ) plane.

d_prime = zeros(1,5);      % Initialize vector of discriminability indices.

for k = 1:5

signal_mean = k*0.5;
y_sig = normpdf(x,signal_mean,std_dev);

% Calculuate d_prime.

d_prime(k) = (signal_mean - absent_mean)/std_dev; % independent of stimulus value

% Determine false alarm and hit probabilities 
% as functions of the stimulus level, 
% acting as if that stimulus level to be used as the criterion level.

prob_false_alarm = 1 - (cumsum(y_abs)*increment); % 1 - P(Correct Rejection)
prob_hit = 1 - (cumsum(y_sig)*increment);         % 1 - P(Miss)

% Plot the ROC curve for the current discriminability index.

plot(prob_false_alarm,prob_hit,'color',C{k})

end

end

