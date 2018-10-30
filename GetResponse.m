function [ Response, ResponseTime ] = GetResponse(hfig)
%
% This function waits for the user to press a key.
% It returns Response as TRUE if the key pressed is lower-case 'z,'
% and returns Response as FALSE otherwise.
% it also returns the time elapsed until the key is pressed.

% The response time is recorded to the nearest MILLISECOND.

% Author: Alan P. Knoerr           Last Update: November 10, 2015

tic;
waitforbuttonpress;
ResponseTime = int16(1000*toc);  % Report ResponseTime to nearest msec.
response = get(hfig,'CurrentCharacter');
if ( response == 'z')
    Response = true;
else
    Response = false;
end
end

