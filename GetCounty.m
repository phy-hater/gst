function GetCounty(startDate, endDate)

all_county_names={...
    'San Francisco County, San Francisco, CA, USA'
    'Santa Clara County, CA, USA'
    'Howard County, MD, USA'
    'Davis County, UT, USA'
    'San Mateo County, CA, USA'
    'Marin County, CA, USA'
    'Alameda County, CA, USA'
    'Giles County, VA, USA'
    'Pocahontas County, WV, USA'
    'Pima County, AZ, USA'
    'Grand County, UT, USA'
    'San Diego County, CA, USA'
    'Coconino County, AZ, USA'
    'Baltimore County, MD, USA'
    'Anne Arundel County, MD, USA'
    'Contra Costa County, CA, USA'
    'Sonoma County, CA, USA'
    'Mohave County, AZ, USA'
    'McKinley County, NM, USA'
    'Knox County, TN, USA'
    'Pulaski County, AR, USA'
    'Potter County, TX, USA'
    'Tooele County, UT, USA'
    'Elko County, NV, USA'
    'Unknown'
    'Monterey County, CA, USA'
    'Santa Cruz County, CA, USA'
    'Solano County, CA, USA'
    'Kern County, CA, USA'
    'Placer County, CA, USA'
    'Sacramento County, CA, USA'
    'Los Angeles County, CA, USA'
    'Salt Lake County, UT, USA'
    'San Bernardino County, CA, USA'
    'Humboldt County, NV, USA'
    'Utah County, UT, USA'
    'Fresno County, CA, USA'
    'Calvert County, MD, USA'
    'Pershing County, NV, USA'
    'Bernalillo County, NM, USA'
    'Nevada County, CA, USA'
    'Box Elder County, UT, USA'
    'Harford County, MD, USA'
    'Davidson County, TN, USA'
    'Apache County, AZ, USA'
    'Harris County, TX, USA'
    'Washoe County, NV, USA'
    'Oklahoma County, OK, USA'
    'Maricopa County, AZ, USA'
    'Santa Barbara County, CA, USA'
    'Prince George''s County, MD, USA'
    'La Paz County, AZ, USA'
    'Weber County, UT, USA'
    'Yavapai County, AZ, USA'
    'Medina County, OH, USA'
    'Pinal County, AZ, USA'
    'Washington County, MD, USA'
    'Riverside County, CA, USA'
    'Greenbrier County, WV, USA'
    'Kings County, CA, USA'
    'Merced County, CA, USA'
    'Navajo County, AZ, USA'
    'Botetourt County, VA, USA'
    'Roane County, TN, USA'
    'Yolo County, CA, USA'
    'Orange County, CA, USA'
    'Shenandoah County, VA, USA'
    'Guadalupe County, NM, USA'
    'Culberson County, TX, USA'
    'Churchill County, NV, USA'
    'Carbon County, UT, USA'
    'Lander County, NV, USA'
    'Augusta County, VA, USA'
    'Sebastian County, AR, USA'
    'Napa County, CA, USA'
    'Eureka County, NV, USA'
    'Emery County, UT, USA'
    'Stanislaus County, CA, USA'
    'Luna County, NM, USA'
    'Cabarrus County, NC, USA'
    'Frederick County, MD, USA'
    'Rockingham County, VA, USA'
    'San Luis Obispo County, CA, USA'
    'Rockbridge County, VA, USA'
    'Wythe County, VA, USA'
    'Montgomery County, VA, USA'
    'Highland County, VA, USA'
    'Cibola County, NM, USA'
    'Lyon County, NV, USA'
    'Faulkner County, AR, USA'
    'Monroe County, WV, USA'
    'Ventura County, CA, USA'
    'San Joaquin County, CA, USA'
    'Jefferson County, WV, USA'
    'Frederick County, VA, USA'
    'St Francis County, AR, USA'
    'Torrance County, NM, USA'
    'Sequoyah County, OK, USA'
    'Beckham County, OK, USA'
    'Roanoke County, VA, USA'
    'Canadian County, OK, USA'
    'Mecklenburg County, VA, USA'
    'Oldham County, TX, USA'
    'Fairfax County, VA, USA'
    'Greene County, TN, USA'
    'Putnam County, TN, USA'
    'Shelby County, TN, USA'
    'Sullivan County, TN, USA'
    'Washington County, VA, USA'
    'Madison County, TN, USA'
    'McIntosh County, OK, USA'
    'Custer County, OK, USA'
    'Carson County, TX, USA'
    'Wheeler County, TX, USA'
    'Wilson County, TN, USA'
    'Clarke County, VA, USA'
    'Fauquier County, VA, USA'
    'Pope County, AR, USA'
    'Johnson County, AR, USA'
    'Montgomery County, MD, USA'
    'Quay County, NM, USA'
    'Smyth County, VA, USA'
    'Gray County, TX, USA'
    'San Benito County, CA, USA'
    'Haywood County, TN, USA'
    'Pottawatomie County, OK, USA'
    'Warren County, VA, USA'
    'Henderson County, TN, USA'
    'Crittenden County, AR, USA'
    'Lonoke County, AR, USA'
    'Crawford County, AR, USA'
    'Jefferson County, TN, USA'
    'Burnet County, TX, USA'
    'Dickson County, TN, USA'
    'Prairie County, AR, USA'
    'Conway County, AR, USA'
    'Okfuskee County, OK, USA'
    'Cumberland County, TN, USA'
    'Franklin County, AR, USA'
    'Seminole County, OK, USA'
    'Caddo County, OK, USA'
    'Pulaski County, VA, USA'
    'Smith County, TN, USA'
    'Prince William County, VA, USA'
    'Fayette County, TN, USA'
    'Hickman County, TN, USA'
    'Muskogee County, OK, USA'
    'Washita County, OK, USA'
    'Monroe County, AR, USA'
    'Hamblen County, TN, USA'
    'Humphreys County, TN, USA'
    'Okmulgee County, OK, USA'
    'El Paso County, TX, USA'
    'Benton County, TN, USA'
    'Graham County, AZ, USA'
    'Sierra County, CA, USA'
    'Randall County, TX, USA'
    'Westmoreland County, PA, USA'
    'Cheatham County, TN, USA'
    'Santa Fe County, NM, USA'
    'Donley County, TX, USA'
    'Wasatch County, UT, USA'
    'Doña Ana County, NM, USA'
    'Hidalgo County, NM, USA'
    'Carroll County, MD, USA'
    'Somerset County, PA, USA'
    'Loudon County, TN, USA'
    'Columbiana County, OH, USA'
    'Washington County, TN, USA'
    'Sevier County, TN, USA'
    'Decatur County, TN, USA'
    'McCulloch County, TX, USA'
    'York County, SC, USA'
    'Storey County, NV, USA'
    'Tom Green County, TX, USA'
    'Orange County, NC, USA'
    'San Saba County, TX, USA'
    'Randolph County, NC, USA'
    'Granville County, NC, USA'
    'Stark County, OH, USA'
    'Williamson County, TN, USA'
    'Carroll County, TN, USA'
    'Greenlee County, AZ, USA'
    'Fayette County, PA, USA'
    'Concho County, TX, USA'
    'Grimes County, TX, USA'
    'Bedford County, PA, USA'
    'Hudspeth County, TX, USA'
    'Waller County, TX, USA'
    'Union County, SC, USA'
    'Mecklenburg County, NC, USA'
    'Davidson County, NC, USA'
    'Alamance County, NC, USA'
    'Loudoun County, VA, USA'
    'Allegany County, MD, USA'
    'Beaver County, PA, USA'
    'Summit County, OH, USA'
    'Deaf Smith County, TX, USA'
    'Monroe County, WV, USA'
    'Orange County, NC, USA'
    'Pocahontas County, WV, USA'
    
    };
total_all_count=length(all_county_names);

%out_file='counties.csv';
num_url_retry=3;
in_dir = 'C:\Users\gluckert\OneDrive - Marvell\Personal\Followmee-data\temp';

if isempty(startDate)
    startDate=datenum('1/1/1900');
end

if isempty(endDate)
    endDate=datenum('1/1/2100');
end

f=dir(in_dir);
ix1=1;
raw_data={};
%last_timestamp=[];
for fix=1:length(f)
    this_file_name=f(fix).name;
    [~,~,this_ext]=fileparts(this_file_name);
    if strcmp(this_ext,'.csv')
        this_file_year=str2double(this_file_name(18:21));
        this_file_month=str2double(this_file_name(23:24));
        this_file_day=str2double(this_file_name(26:27));
        this_file_datenum=datenum(this_file_year,this_file_month,this_file_day);
        if this_file_datenum>=startDate && this_file_datenum<=endDate
            %last_timestamp=this_file_datenum;
            warning off
            c = readtable([in_dir,'\',this_file_name]);
            warning on
            c = [c(1,:); c; c(end,:)];
            c.Date(1)=datestr(this_file_datenum);
            c.Date(end)=datestr(this_file_datenum+0.999988426);
            fprintf('\n%s ',this_file_name);
        else
            continue
        end
    else
        continue;
    end
    num_pts=height(c);
    for mix=1:num_pts
        this_lat=c.Lat(mix);
        this_long=c.Lng(mix);
        this_s_time=c.Date(mix);
        %this_s_h_offs=this_s_time(21:22);
        %this_s_m_offs=this_s_time(24:25);
        %this_s_t=this_s_time(1:19);
        %this_t=datenum(this_s_t)+str2double(this_s_h_offs)/24+str2double(this_s_m_offs)/(60*24);
        this_t=datenum(this_s_time);
        us=sprintf('https://maps.googleapis.com/maps/api/geocode/json?latlng=%0.9f,%0.9f&result_type=administrative_area_level_2&key=AIzaSyDUf3GC36mWcRCFIqQbWF3RkUzDv3IdFHA',this_lat,this_long);
        for rix=1:num_url_retry
            try
                js=webread(us);
                if strcmp(js.status, 'OK')
                    raw_data{ix1,1}=this_t;
                    raw_data{ix1,2}=js.results.formatted_address;
                    if mod(mix,5)==1
                        fprintf('.');
                    end
                    ix1=ix1+1;
                else
                    error('webread returned %s',js.status);
                end
                break;
            catch E2
                save get_county_dump.mat
                if rix==num_url_retry
                    fprintf('*');
                    raw_data{ix1,1}=this_t;
                    raw_data{ix1,2}='Unknown';
                    ix1=ix1+1;
                end
            end
        end
    end
end


n=length(raw_data(:,1));
raw_data=sortrows(raw_data);
%raw_data(n+1,:)={ceil(raw_data{n,1})-last_timestamp,raw_data{n,2}};
%n=n+1;
fprintf('\nFound %g points\n',n);
county_time={raw_data{1,2},raw_data{2,1}-raw_data{1,1}};
kx=2;
for jx=2:n-1
    this_cty=raw_data{jx,2};
    match_ix=strmatch(this_cty,county_time(:,1));
    if isempty(match_ix)
        county_time{kx,1}=this_cty;
        county_time{kx,2}=raw_data{jx+1,1}-raw_data{jx,1};
        kx=kx+1;
    else
        county_time{match_ix,2}=county_time{match_ix,2}+raw_data{jx+1,1}-raw_data{jx,1};
    end
end
%%county_time
fprintf('\n\n');
%num_counties=length(county_time(:,1));
total_time = sum(cell2mat(county_time(:,2)));
for iix=1:total_all_count
    fprintf('%s\t',all_county_names{iix})
    all_count_ix=find(strcmp(all_county_names{iix},county_time(:,1)));
    if ~isempty(all_count_ix)        
        fprintf('%8.3f%%\t%6.3f\n',100*county_time{all_count_ix(1),2}/total_time, 24*county_time{all_count_ix(1),2});
    else
        fprintf('0%%\t0\n');
    end
end
