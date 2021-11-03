function out = boxt(t,t1,t2)

% inputs: t:  a time vector series. For example t=-10:0.1:10;
%         t1: start time (in seconds) of the box function
%         t2: endi time (in seconds) of the box function    
%         t1 and t2 must be within the rang of the given t vector
% output: out: it contains the delayed unit step function u(t-ts)
%
% example: 
%     t=-10:0.1:10;
%     boxsig = boxt(t,-3,3);
%     plot(t,boxsig);

% call unitstep to create u(t-t1)
x = unitstep(t,t1);
% call unitstep to create u(t-t2)
y = unitstep(t,t2);

out = x - y;


function out=unitstep(t,ts)

% inputs: t:  a time vector series. For example t=-3:0.1:3;
%         ts: time shift value (in seconds) of the unit impluse
%             function. 
%             ts>0: shift to the ight; ts<0:shift to the left
%             ts must be within the rang of the given t vector
% output: out: it contains the delayed unit step function u(t-ts)
% how to use:   For exampe: 
%               > t=-5:0.01:5;
%               > ut=unitstep(t,3);
%               > plot(t,ut);

if ts>max(t) | ts<min(t)
    disp('Please make sure the time shift value is within the range of your time vector!');
    out=[];
    return;
else
    out=zeros(size(t)); % initialize with all zeros
    for i=1:length(t)
        if t(i)>ts      % set to 1 for t>ts
            out(i)=1;
        end;
    end;
end;
