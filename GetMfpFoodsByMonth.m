function GetMfpFoodsByMonth(monthNum, yearNum)

xls_file_name = 'MFP-raw-data.xlsx';
sheet_name = sprintf('%02d-%04d',monthNum,yearNum);

persistent text_xls_data
persistent num_xls_data;
persistent raw_xls_data;
if isempty(text_xls_data) || isempty(num_xls_data)
    [num_xls_data,text_xls_data,raw_xls_data]=xlsread(xls_file_name,sheet_name);
end

num_rows = length(num_xls_data(:,1));
num_cols = length(num_xls_data(1,:));
row_ix = 1; col_ix = 1;
cur_date = 0;
cur_meal_id = 0;
all_data = {};
all_ix=1;
while col_ix<=num_cols
    
    if col_ix==233 && row_ix==50
        break_var=1;
    end
    
    this_str=raw_xls_data{row_ix, col_ix};
    
    if row_ix==1
        
        if strcmp(this_str,'Your Food Diary For:')
            row_ix=row_ix+2;
            this_date_str1=raw_xls_data{row_ix, col_ix};
            this_date_str1_splt=split(this_date_str1,',');
            this_date_str2=sprintf('%s, %s',this_date_str1_splt{2},this_date_str1_splt{3});
            cur_date=datenum(this_date_str2);
            cur_meal_id=1;
            row_ix=row_ix+3;
            this_str=raw_xls_data{row_ix, col_ix};
        else
            col_ix=col_ix+1;
            continue;
        end
        
    end
    
    if strcmp(this_str,'Lunch (11 AM To 6 PM)')
        cur_meal_id=2;
    elseif strcmp(this_str,'Dinner (After 6 PM)')
        cur_meal_id=3;
    elseif ~isempty(this_str) && ~any(isnan(this_str)) && ~any(isnumeric(this_str)) && ~strcmp(this_str,'Quick Tools') && ~strcmp(this_str,'Add Food ') && ~strcmp(this_str,'Remaining') && ~strcmp(this_str,'Totals') && ~strcmp(this_str,'Your Daily Goal')
        all_data{all_ix,1}=cur_date;
        all_data{all_ix,2}=cur_meal_id;        
        all_data{all_ix,3}=this_str;
        all_data{all_ix,4}=raw_xls_data{row_ix,col_ix+1};
        all_data{all_ix,5}=raw_xls_data{row_ix,col_ix+2};
        all_data{all_ix,6}=raw_xls_data{row_ix,col_ix+3};
        all_data{all_ix,7}=raw_xls_data{row_ix,col_ix+4};
        all_data{all_ix,8}=raw_xls_data{row_ix,col_ix+5};
        all_data{all_ix,9}=raw_xls_data{row_ix,col_ix+6};      
         fprintf('%s\n',all_data{all_ix,3});
        all_ix=all_ix+1;
    elseif strcmp(this_str,'Remaining')
        col_ix=col_ix+1;
        row_ix=1;
        continue;
    end
    
    row_ix=row_ix+1;
    %if row_ix==num_rows
    %    col_ix=col_ix+1;
    %    row_ix=1;  
    %end
    
end

outfile_name='temp.txt';
fid=fopen(outfile_name,'w');
total_entries=length(all_data(:,1));
for jx=1:total_entries
    fprintf(fid,'%g~%s~%g~%s~%g~%g~%g~%g~%g~%g\n', jx, datestr(all_data{jx,1},1), all_data{jx,2}, all_data{jx,3}, all_data{jx,4}, all_data{jx,5}, all_data{jx,6}, all_data{jx,7}, all_data{jx,8}, all_data{jx,9});
end



