function FormatNomie5CsvFile(fileName)
%*FormatNomie5CsvFile* converts Nomie 5 CSV file to Nomie 2 CSV file forma
%
%
%
%
%

% History (not tracking changes to tracker_map, updates with new ID's)
% 8/16/21 - Fixed issue with ms timestamp being relative to year 0 instead
% of 1970. Added title row with column titles to output file.
% 6/4/22 - Fixed drank_coffee Nomie ID
% 6/5/23 - Added a bunch of ID's and modified output_dir for new PC
% 7/24/23 - Added many new ID's
%
%
%

output_dir='C:\Users\gluckert\OneDrive - Marvell\Personal\Nomie';

% Nomie5 trackers to ignore
invalid_trackers={
    'betsy_dasuquin'
    'washed_hands'
    };

% Nomie5 trackers that are numeric entry type in N5 that were two counters 
% in N2: numeric and counter type. For each instance of numeric N5 tracker, 
% a another counter tracker is added. 
dup_count_trackers={
    % N5 tracker    N2 tracker      N2 tracker ID  
    'betsy_miles',  'Walked Betsy', '1508460990887-00msb4'
    'podcasts',     'Podcast',      '1508460840177-00h8x6'
    };

% N5 tracker string to N2 tracker ID
tracker_map={...
    % N5 tracker name            N2 tracker ID           N2 tracker name
    '1_svg_sweets',             '1508463268088-00zyte',  'Sweets'  
    'ate_meat',                 '1508470529660-00f8rb',  'Meat'
    'audiobooks',               '1520055502819-00rvio',  ''       
    'balls_ache',               '1622709446583-0076j5',  ''
    'betsy_benadryl_mg',        '7365089557470-00piut',  ''
    'betsy_dasaquin',           '1514322314756-002923',  ''
    'betsy_dasuquin',           '1514322314756-002923',  ''
    'betsy_d',                  '1514322314756-002923',  ''
    'betsy_miles',              '1554325973810-00a47e',  ''
    'betsy_peed',               '1571332729626-00xorv',  ''
    'betsy_poop',               '1571332450189-00wnqn',  ''
    'betsy_r',                  '1572924918504-00yd6b',  'Betsy Remidyl'
    'betsy_treat',              '1508470622818-00hx4e',  'Betsy treats'
    'betsy_zoomies',            '1537912640209-00p0gl',  ''
    'bicep_skin_fold',          '1513499825961-00fajc',  'Left bicep skin fold'
    'betsy_tooth_treat',        '1527575209210-00640y',  ''
    'binge_ate',                '1508463216651-00imlu',  'Binge ate'
    'bite_lip',                 '1576802693287-00m5oz',  ''
    'book_pages',               '1520055457931-00my1i',  'Book pages'
    'brain_shocks',             '1508527974410-00h4tm',  'Brain shocks'
    'brush_teefers',            '1508461083835-00q3bv',  'Brushed teeth'
    'bupropion',                '1517022674681-00siy0',  ''
    'canker_not_on_tongue',     '1519184910273-001bov',  ''
    'canker_on_tongue',         '1519184809354-005dqc',  ''
    'cardio',                   '1508461246232-00fpig',  'Cardio'
    'caugh',                    '1516912614240-00cmop',  ''
    'changed_sheets',           '1512975830760-00id3w',  'Change sheets'
    'changed_razor',            '1516912614240-00cmoq',  ''
    'charge_bluetooth_headphones', '1511041019436-009gcr',  'Charge Sony headset'
    'charge_ear_pods',          '4900323495460-00tbic', ''
    'charge_fitbit',            '1510630949427-00wp4a',  'Charge fitbit'
    'charge_iphone8',           '1521324668689-007oxf',  ''
    'charge_iphone_13',         '9033026984303-00lydi',  ''
    'charge_logitech_keyboard', '1564270858442-00dkkz',  ''
    'charge_watch',             '1510609129128-00bisz',  'Charge watch'
    'cleaned_kitchen',          '1508462912646-00ssm0',  'Clean kitchen'
    'cleaned_betsy_ears',       '3960112308576-00faqv',  ''
    'chest_pain_/_angina',      '1598239066500-009dh5',  ''
    'cried',                    '9354372365526-00hydk', ''
    'cut_fingernails',          '1508463053992-00nr8v',  'Cut fingernails'
    'cut_toenails',             '1508463082237-00xddc', ''
    'dentek_molars',            '1526879871164-00152n',  ''
    'deodorant',                '1516864643829-00f6iu',  ''
    %'drank_coffee',             '1508460753640-00fnih',  'Drank coffee' % This is actually the "I peed" tracker ID fixed 6/4/22
    'drank_coffee',             '1508460889958-00qu98',  'Drank coffee'
    'drank_water',              '1513578980640-00znwt',  'Water fl oz'
    'duloxetine',               '1517022770488-00ds72',  ''
    'eir',                      '1549097849139-00p0tx',  'exercise_induced_rhinitas'
    'espresso_shot',            '1508461333398-00voxm',  'Espresso shot'  
    'fart',                     '1517022197835-00movc',  ''
    'fed_betsy',                '1508460945889-00dayf',  'Fed betsy'
    'floss',                    '1508461023269-00p57y',  'Flossed'
    'how_is_your_day',          '4890480446336-00expz',  ''
    'gi_distress',              '1517022367970-0041p1',  ''
    'got_fitbit_target',        '1508461405791-009j2l',  'Got fitness targets'
    'green_shake',              '1508471479681-006q5m',  'Green shake'
    'hangnail',                 '1519836475916-004oob',  ''
    'headache',                 '1517018546799-00dkg0',  ''
    'heartburn',                '1517022277622-008cp8',  ''
    'heel_pain',                '1517022445152-00a6kw',  ''
    'hiccups',                  '1524101799082-0022yj',  'hiccups'
    'hold_breath',              '1526661230838-00juzd',  'Breath holding'
    'how_is_your_day?',         '2478780522797-00laxu',  ''
    'i_…_ahem',                 '1508461364554-00j19f',  'I... ahem'
    'injury',                   '1572681488322-00oxqm',  ''
    'inside_thigh_skin_fold',   '1513500121462-00xxe0',  'Left inner thigh'
    'iphone_13_battery_max_capacity','0482903893387-00rbyx', ''
    'itchy_asshole',            '1518338183716-00xwax',   'itchy_asshole'
    'k_says_goodnight',         '1557553307163-00zolo',  ''
    'k_expressed_affection',    '1548562561389-00bo40',  ''
    'k_sinus_infection',        '1537641821897-00hgon',  'k_sinus_infection_old'
    'keli_temp',                '9373208632942-00rxyc',  ''
    'load_of_dishes',           '1508697191240-00ammp',  'Load of dishes'
    'load_of_laundry',          '1508697191240-00ammp',  'Laundry load'
    'left_side_skin_fold',      '1513499798338-00i3r1',  'Left side skin fold'
    'lie',                      '1516912692010-00cjwn',  'Lie'   
    'limbs_asleep_not_numb_pinky', '4531831900692-00olsf', ''
    'lower_back_pain',          '1574659557272-00nmi5',  ''
    'mood_diary',               '1513759007285-003o9w',  'Mood diary'
    'meds',                     '1508463956111-004p8q',  'Meds'
    'mosquito_biye',            '1560212836588-006ktm',  ''
    'movie_minutes',            '1520055048624-00vbsu',  'Movie minutes'
    'muscles_soreness_today',   '1517022487420-00522x',  ''
    'note',                     '0000000000000-000000',  ''
    'numb_left_pinky',          '1516912503677-00pxh5',  ''
    'other_caffeine',           '1518658269132-0098fl',  ''    
    'peed',                     '1508460753640-00fnih',  'Peed'
    'pimples',                  '1517022399849-00lgvn',  ''
    'podcasts',                 '1520055100375-0083mu',  'Podcast minutes'
    'poops',                    '1508463022842-00eyax',  'Pooped'
    'prostate_/_peen_/_bladder_pain', '1578945930605-00f6jw', 'Peener/bladder/prostate pain'
    'pulled_hair',              '1508463316898-00ichw',  'Pulled hair'
    'right_arm_pain',           '2928686879926-00tibt',  '' % New N2 tracker ID added to N5 and not N2
    'rinse_terth',              '1513670209667-00fhl5',  'Rinsed mouth'
    'rode_vta',                 '4940230063139-00ovse',  '' % Rode VTA light rail
    'rode_vta_bus',             '4940230063139-00ovsf',  ''
    'runny_nose',               '1516912545804-00mzl0',  ''
    'seeing_stars',             '2908858145591-00faaq',  ''
    'shave',                    '1508461180487-001fwb',  'Shaved'
    'shower',                   '1508461151036-00a3dd',  'Showered'
    'skin_temp',                '1508464034964-00vz34',  'Temperature'
    'sleep_paralysis',          '4333727614212-00qetz',  '' 
    'sneezed',                  '1508482876153-004ndr',  'Sneezed'
    'sore_neck_/_shoulder_/_upper_back', '1575312832822-00uh77',  ''
    'sore_shoulder',            '4886392274374-00wyxr',  ''
    'sore_throat',              '1517018611153-00627l',  ''
    'sore_or_bloody_gums',      '1569744488067-00lq51',  ''
    'spoke_to_human',           '1508463620926-00in0k',  'Spoke to human'
    'stairs',                   '1508470368776-00k6un',  'climbed_stair flight'
    'std_alcoholic_dtink',      '1508483376255-00elfo',  'Drink'
    'strength',                 '1508461281111-000x95',  'Strength'
    'sunburn',                  '1592716879963-00gqpy',  ''
    'swabbed_ears',             '1517757371134-0068j0',  ''
    'television_minutes',       '1520055343724-00l3ni',  'TV minutes'
    'took_a_nap',               '1508697275556-00qrxa',  ''
    'took_out_trash',           '1519836623176-00ecms',  ''
    'took_out_recycling',       '1519836656526-00cfvu',  ''
    'twitching_eye',            '1555738828361-000z0o',  ''
    'wash_hands',               '1517041609569-0097wy',  ''
    'washed_hands',             '1517041609569-0097wy',  ''
    'wear_tooth_appliance',     '4426896707824-00unob',  ''
    'wearing_contacts',         '1508463889859-00t5g9',  ''
    'weight',                   '1508464102837-00xaiq',  'Weight'
    'work_laptop_update',       '1445061722000-000WLU',  ''
    'Balls_ache',               '1622709446583-0076j5',  ''
    'Deodorant',                '1516864643829-00f6iu',  ''    
    'carried_toby_up_on_left',  '0000000000000-aaaaaa',  ''
    'walked_toby',              '0000000000000-bbbbbb',  ''
    'toby_peed',                '0000000000000-cccccc',  ''
    'toby_pooped',              '0000000000000-dddddd',  ''
    'carried_toby_down_on_left','0000000000000-eeeeee',  ''  
    'toby_benadryl_50_mg',      '0000000000000-ffffff',  ''  
    'toby_ate',                 '0000000000000-gggggg',  ''      
    'toby_dasuquin',            '0000000000000-hhhhhh',  ''          
    'carried_toby_up_on_right', '0000000000000-iiiiii',  ''              
    'carried_toby_down_on_right','0000000000000-jjjjjj',  ''                  
    'toby_75mg_rimadyl',        '0000000000000-kkkkkk',  ''                      
    'toby_vomited',             '0000000000000-llllll',  ''                          
    'dasuquin',                 '0000000000000-mmmmmm',  '' 
    'toby_doxycycline',         '0000000000000-nnnnnn',  ''
    'toby_ate_substantial_snack', '0000000000000-oooooo',  ''
    '19th_to_85',               '0000000000000-pppppp',  ''  
    'home_to_280_on_sunset',    '0000000000000-qqqqqq',  ''  
    '280_to_home_by_sunset',    '0000000000000-rrrrrr',  '' 
    '85_to_19th',               '0000000000000-ssssss',  '' 
    'toby_tooth_treat',         '0000000000000-tttttt',  '' 
    'bathed_toby',              '0000000000000-uuuuuu',  '' 
    'toby_heartguard',          '0000000000000-vvvvvv',  '' 
    'destination',              '0000000000000-wwwwww',  '' 
    'detour',                   '0000000000000-xxxxxx',  '' 
    '19th_to_home',             '0000000000000-yyyyyy',  '' 
    'home_to_280',              '0000000000000-zzzzzz',  '' 
    'toby_ate_one_cup',         '0000000000001-aaaaaa',  ''
    'toby_cytopoint',           '0000000000001-bbbbbb',  ''
    '280_to_home_via_skyline',  '0000000000001-cccccc',  ''
    'toby_frontline',           '0000000000001-dddddd',  ''
    'used_toll_lane',           '0000000000001-eeeeee',  ''
    'wordle',                   '0000000000001-ffffff',  ''    
    'mugi_peed',                '0000000000002-000000',  ''    
    'left_knee_pain',           '0000000000002-111111',  ''    
    'olive_peed',               '0000000000002-222222',  ''    
    'olive_pooped',             '0000000000002-333333',  ''    
    'mugi_pooped',              '0000000000002-444444',  ''    
    'unusual_heartbeat',        '0000000000002-555555',  ''        
    'fell',                     '0000000000002-666666',  ''            
    'chew_gum',                 '0000000000002-777777',  ''    
    'tody',                     '0000000000002-888888',  ''    
    'rightshouldersurgerywoundpain',    '0000000000002-999999',  ''  
    'acetaminophenmg',          '0000000000002-aaaaaa',  ''
    'rightkneepain',            '0000000000002-bbbbbb',  ''
    'coccyxpain',               '0000000000002-cccccc',  ''
    'leftlegpain',              '0000000000002-dddddd',  ''
    'rightshoulderpain',        '0000000000002-eeeeee',  '' 
    'rightachillespain',        '0000000000002-ffffff',  '' 
    'cuthairandbrowswith02',    '0000000000003-000000',  '' 
    'right_foot_pain',          '0000000000003-111111',  '' 
    'leftachillespain'          '0000000000003-222222',  ''    
    'lowerabdominalpain',       '0000000000003-333333',  ''    
    'left_ankle_pain',          '0000000000003-444444',  ''    
    'rightgroinmusclepain',     '0000000000003-555555',  ''   
    'midbackpain',              '0000000000003-666666',  ''   
    'autoevernoteinstalled',    '0000000000003-777777',  ''   
    'righthandpain',            '0000000000003-888888',  ''   
    'leftelbowpain',            '0000000000003-999999',  ''   
    'left_foot_pain',           '0000000000003-AAAAAA',  ''   
    'girls_ate',                '0000000000003-BBBBBB',  ''       
    'leftshoulderpain',         '0000000000003-CCCCCC',  ''     
    'leftcranestand',           '0000000000003-DDDDDD',  ''     
    'rightcranestand',          '0000000000003-EEEEEE',  ''         
    'lefthippain',              '0000000000003-FFFFFF',  ''         
    };

% Get the file parts
[this_input_path,this_input_file_name,this_input_ext]=fileparts(fileName);

% Remove first line and blank lines
file_s='';
file_ix=1;
fid1=fopen(fileName,'r');
try
    while ~feof(fid1)
        this_s=fgetl(fid1);
        if file_ix>1 && ~isempty(this_s)
            this_s(end+1)=sprintf('\n');
            file_s=[file_s,this_s];
        end
        file_ix=file_ix+1;
    end
catch ER
    fclose(fid1);
    rethrow(ER);
end
fclose(fid1);

% Write first modifiied file
first_mod_file_name=[this_input_path,'\',this_input_file_name,'_temp',this_input_ext];
fid2=fopen(first_mod_file_name,'w');
fwrite(fid2,file_s);
fclose(fid2);

% Open the new file and import the data
fid3=fopen(first_mod_file_name,'r');
try
    
    % c_m5_toks{1}: (numeric) ms since 1970
    % c_m5_toks{2}: (string) GMT string start date 'YYYY-MM-DDTHH:mm:ss.mmm'
    % c_m5_toks{3}: (string) GMT string end date 'YYYY-MM-DDTHH:mm:ss.mmm'
    % c_m5_toks{4}: (numeric) offset minutes from GMT, positive
    % c_m5_toks{5}: (string) N5 tracker ID
    % c_m5_toks{6}: (numeric) tracker value
    % c_m5_toks{7}: (string) Nomie 5 command string
    % c_m5_toks{8}: (numeric) latitude
    % c_m5_toks{9}: (numeric) longitude
    % c_m5_toks{10}: (string) "location"
    % c_m5_toks{11}: (numeric) score
    c_m5_toks=textscan(fid3,'%f%s%s%f%s%f%s%f%f%s%f','delimiter',',');
    
catch ER
    fclose(fid3);
    rethrow(ER);
end
fclose(fid3);

m5_ms=cell2mat(c_m5_toks(1));
m5_gmt_s=c_m5_toks{3}; % Use end time as the timestamp
m5_gmt_offset=-1*cell2mat(c_m5_toks(4));
m5_tracker_id=c_m5_toks{5};
m5_tracker_value=c_m5_toks{6};
m5_latitude=cell2mat(c_m5_toks(8));
m5_longitude=cell2mat(c_m5_toks(9));

% Go through the list of trackers and reformat for N2
c_m2_toks={};
num_new_points=0;
num_old_points=length(c_m5_toks{1});
this_start_date=1e9;
this_end_date=0;
kx=1;
for ix=1:num_old_points
    this_m5_tracker_id=m5_tracker_id{ix};
    % Check if this tracker should be ignored
    % If not, find ID
    if ~any(strcmpi(this_m5_tracker_id,invalid_trackers))
        
        % Get the Nomie2 tracker ID
        this_ix=find(strcmp(this_m5_tracker_id,tracker_map(:,1)));
        if isempty(this_ix)
            error('Could not find Nomie 2 ID for %s',this_m5_tracker_id);
        elseif length(this_ix)>1
            error('Found multiple Nomie 2 ID''s for %s',this_m5_tracker_id);
        end
        this_nomie2_id=tracker_map{this_ix,2};
        this_local_date = datenum(m5_gmt_s{ix},'YYYY-mm-ddTHH:MM:SS.FFF');
        this_tz_offset=m5_gmt_offset(ix);
        this_gmt_date=this_local_date-this_tz_offset/1440;
        this_iso_date_s = datestr(this_gmt_date,'YYYY-mm-ddTHH:MM:SS.FFFZ'); % 2021-07-12T07:00:17.501Z
        this_excel_date_s=datestr(this_local_date,'mmm dd YYYY HH:MMPM');
        %this_ms_ts=m5_ms(ix); % Timestamp in ms
        % ** Cannot use the ms timestamp in N5 file as (1) it doesn't change
        % when edited in app; (2) it is local time
        % ** Need to create new timestamp from GMT
        % ** N2 & N5 timestamps are ms since 1/1/1970 00:00 
        % ** Matlab date numbers are days since year 0 (as opposed to 1990
        % or 1970 in excel)
        this_ms_ts=round((this_gmt_date-datenum('1/1/1970 00:00'))*1000*24*60*60);
        [~,this_day_name]=weekday(this_local_date,'long'); % Weekday name
        this_month_name=datestr(this_local_date,'mmmm'); % Month name
        this_value=m5_tracker_value(ix);
        this_lat=m5_latitude(ix);
        this_long=m5_longitude(ix);
        %num_new_points=num_new_points+1;
            
        % Use the N2 tracker name if supplied. Otherwise, use the N5 tracker
        % name.
        if isempty(tracker_map{this_ix,3})
            output_nomie_tracker_name=this_m5_tracker_id;
        else
            output_nomie_tracker_name=tracker_map{this_ix,3};            
        end
        
        c_m2_toks{kx,1}=this_iso_date_s;
        c_m2_toks{kx,2}=this_excel_date_s;
        c_m2_toks{kx,3}=this_tz_offset;
        c_m2_toks{kx,4}=this_ms_ts;
        c_m2_toks{kx,5}=this_day_name;
        c_m2_toks{kx,6}=this_month_name;
        c_m2_toks{kx,7}=output_nomie_tracker_name;
        c_m2_toks{kx,8}=this_nomie2_id;
        c_m2_toks{kx,9}=0; % "Charge value"
        c_m2_toks{kx,10}=this_value;
        c_m2_toks{kx,11}=this_lat;
        c_m2_toks{kx,12}=this_long;
        
        % Add another entry for those numeric trackers that had a counter
        % tracker in Nomie 2
        this_ix2=find(strcmp(this_m5_tracker_id,dup_count_trackers(:,1)));
        if(~isempty(this_ix2))
            kx=kx+1;            
            c_m2_toks{kx,1}=this_iso_date_s;
            c_m2_toks{kx,2}=this_excel_date_s;
            c_m2_toks{kx,3}=this_tz_offset;
            c_m2_toks{kx,4}=this_ms_ts;
            c_m2_toks{kx,5}=this_day_name;
            c_m2_toks{kx,6}=this_month_name;
            c_m2_toks{kx,7}=dup_count_trackers{this_ix2,2};
            c_m2_toks{kx,8}=dup_count_trackers{this_ix2,3};
            c_m2_toks{kx,9}=0; % "Charge value"
            c_m2_toks{kx,10}=1;
            c_m2_toks{kx,11}=this_lat;
            c_m2_toks{kx,12}=this_long;            
        end
        
        kx=kx+1;
        
    end
    
    % Get the start and end date
    if this_local_date<this_start_date
        this_start_date=this_local_date;
    end
    if this_local_date>this_end_date
        this_end_date=this_local_date;
    end
    
    
end

% Get number of new points
num_new_points=length(c_m2_toks(:,1));

% Print message about number of points found in N5 file and number of
% points in N2 replica file
fprintf('Found %g points in the Nomie 5 output file\n',num_old_points);
fprintf('There are %g points in the Nomie 2 emulation file\n',num_new_points);
fprintf('Date range: %s to %s\n',datestr(this_start_date,'mm/dd/yy'),datestr(this_end_date,'mm/dd/yy'));

% Sort output array by ms timestamp in ascending order
c_m2_toks=sortrows(c_m2_toks,4);
    
% Print to new file
outfile_name=sprintf('%s\\Nomie5_ending_%s_beginning_%s.csv',output_dir,datestr(this_end_date,'mmddyyHHMMSS'),datestr(this_start_date,'mmddyyHHMMSS'));
fid4=fopen(outfile_name,'w');
try
    fprintf(fid4,'iso_date,excel_date,offset,time,day,month,tracker,trackerId,charge,value,lat,long\n');
    for jx=1:num_new_points
        fprintf(fid4,'%s,%s,%4.0f,%d,%s,%s,%s,%s,%g,%f,%4.15f,%4.15f\n',...
            c_m2_toks{jx,1},c_m2_toks{jx,2},c_m2_toks{jx,3},c_m2_toks{jx,4},...
            c_m2_toks{jx,5},c_m2_toks{jx,6},c_m2_toks{jx,7},c_m2_toks{jx,8},...
            c_m2_toks{jx,9},c_m2_toks{jx,10},c_m2_toks{jx,11},c_m2_toks{jx,12});
    end
catch ER
    fclose(fid4);
    rethrow(ER);
end
fclose(fid4);

fprintf('Output file: %s\n',outfile_name);

