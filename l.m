function l()

load 'raw-atl2.csv'
act_list=0:11;
day_start = 45531;
day_end   = 45552;
td=(1/24)/3;

book4=raw_atl2(1:end,:);

for this_day=day_start:day_end	
	this_t=this_day;
	for jx=1:(1/td)
        t0=this_t;
		t1=t0+td-1/(60*60*24);
		[this_act_list_count, this_lacuna_count] = GroupTime(act_list, [t0,t1], 0, book4);
		[this_max, this_max_ix]=max(this_act_list_count);
		if(this_max>this_lacuna_count)
			maj_code=act_list(this_max_ix(1));
		else
			maj_code=-1;
		end
		this_t=this_t+td;
		fprintf('%g\t',maj_code);
	end
	fprintf('\n');
end