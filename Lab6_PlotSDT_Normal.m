function [FA,HIT] = Lab6_PlotSDT_Normal( absent_mean,signal_mean,std_dev,criterion_level )

% This function plots two normal density functions,
% one representing the stimulus probability when a signal is present
% and the other representing the stimulus probability when a signal is
% absent. These plots also indicate the criterion level an observer uses 
% to decided whether or not a signal is present.
% (If the stimulus exceeds this criterion level, the observer will decide
% that a signal is present. Otherwise they will decide it is absent.)
%
% It also calculates d_prime, the standardized distance between the means of these
% two distributions, and plots the ROC curve for this value of d_prime.
% Finally, it locates the criterion level on this curve.
%
% The user provides the means of the two distributions satsifying
% 
%                signal_mean > absent_mean
%
% as well as their common standard deviation and the criterion level.
%
% The function outputs the probabilities of a false alarm and of a hit
% when this criterion level is used.
%
% Author: Alan P. Knoerr              Last Update: October 6, 2015
%
% This is based on Chapter 10 of 
% Wallisch et al, "MATLAB for Neuroscientists" 2nd ed.
% (Academic Press, Elsevier, 2014).

%***************************************%
%                                       %
%  Calculate quantities to be plotted.  %
%                                       %
%***************************************% 

% Determine the stimulus values at which to plot densities.

min_stim = absent_mean - 4*std_dev;    % Probability Theory
max_stim = signal_mean + 4*std_dev;   % (Chebyschev's Inequality)
increment = std_dev/10;                % tells us nearly all the probability
x = min_stim:increment:max_stim;       % lies w/in 4 std_devs of the mean.             
 
% Evaluate the densities at these stimulus values.

y_abs = normpdf(x,absent_mean,std_dev);
y_sig = normpdf(x,signal_mean,std_dev);

% Create a vertical line marking the decision criterion.

dcx = [criterion_level, criterion_level];
mode_height = max(y_sig);              % The line should reach as high
dcy = [0, mode_height];                % as the modal peaks of the densities.

% Locate the criterion level within the plotting stimulus levels.

criterion_index = 1 + round((criterion_level - min_stim)/increment);

% Calculuate d_prime.

d_prime = (signal_mean - absent_mean)/std_dev;

% Determine false alarm and hit probabilities 
% as functions of the stimulus level.

prob_false_alarm = 1 - (cumsum(y_abs)*increment);
prob_hit = 1 - (cumsum(y_sig)*increment);

% Create a reference line for the ROC plot.

reference_x = [0, 0];
reference_y = [0, 1];

%*************************%
%                         %
%  Calculate the output.  %
%                         %
%*************************%

FA = prob_false_alarm(criterion_index);
HIT = prob_hit(criterion_index);

%********************%
%                    %
%   Create plots.    %
%                    %
%********************%

figure

% Plot the signal_absent density subplot and label it.

subplot(2,1,1)
plot(x,y_abs,'b')
hold on
plot(dcx,dcy,'k')

title('SDT - Normal Stimuli')
xlabel('Internal Response')
ylabel('Density')
legend( 'Signal Absent', 'Criterion Level')

% Plot the signal_present density subplot and label it.

subplot(2,1,2)
plot(x,y_sig,'r')
hold on
plot(dcx,dcy,'k')

xlabel('Internal Response')
ylabel('Density')
legend( 'Signal Present', 'Criterion Level')

% Construct the ROC plot and label it.

figure
plot(prob_false_alarm,prob_hit,'g')
axis square
hold on
plot(reference_x,reference_y)
%plot(FA,HIT,'*k')

title('ROC Plot')
xlabel('Prob( False Alarm )')
ylabel('Prob( Hit )')
legend( ['d prime = ',num2str(d_prime)])%, 'Reference', 'Criterion')

end

