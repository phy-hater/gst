function varargout = GroupTime(varargin)


% Standard inputs
time_range  = varargin{2};
time_res    = varargin{3};
time_by_act = varargin{4};
act_list    = varargin{1};
time_rng_start = time_range(1);
time_rng_end = time_range(2);

% Standard outputs
act_list_count = zeros(1,length(act_list));
total_time = 0;
lacuna_time = 0;

% Create a vector representing the time period, with one entry per unit
% time
time_rng_vctr = [];
time_inc = 0;
time_period_s = floor((time_rng_end-time_rng_start)*24*60*60)+1;
if time_res==0 % Seconds
	time_rng_vctr=zeros(1,time_period_s);
	time_inc = 1/(24*60*60);
elseif time_res==1 % Minutes
	time_rng_vctr=zeros(1,floor(time_period_s/60));
	time_inc = 1/(24*60);
elseif time_res==2 % Hours
	time_rng_vctr=zeros(1,floor(time_period_s/60/60));
	time_inc = 1/24;
else % Days by default
	time_rng_vctr=zeros(1,floor(time_period_s/60/60/24));
	time_inc = 1;
end
total_time = length(time_rng_vctr);

% Main loop
%
%
this_time=time_rng_start;
for ix=1:total_time
	
	%this_time = this_time + (ix-1)*time_inc;
	jx=find(this_time>=time_by_act(:,2) & this_time<=time_by_act(:,3));
	if length(jx)>0
		this_act=time_by_act(jx(1),1);
		kx=find(this_act==act_list);
		if length(kx>0)
			act_list_count(kx)=act_list_count(kx)+1;
			time_rng_vctr(ix)=this_act;
		else
			error('Unknown activity type')
		end
	else
		lacuna_time=lacuna_time+1;
		time_rng_vctr(ix)=-1;
	end
	this_time = this_time + time_inc;
	
end

varargout{1}=act_list_count;
varargout{2}=lacuna_time;

