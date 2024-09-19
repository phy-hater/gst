function PrintInitialUnits(allFoodsList)

load mfp_food_list

n = length(allFoodsList);
m = length(mfp_food_list);

for ix=1:n
    this_food_item=allFoodsList{ix};
    for jx=1:m
        this_unit_amount=-1;
        this_unit_name='Unknown';
        this_ref_food_item=mfp_food_list(jx).string;
        kx=strfind(this_food_item,this_ref_food_item);
        if ~isempty(kx) && kx(1)==1
            k=length(this_ref_food_item);
            if this_food_item(k+1)==','
                this_unit_string=this_food_item(k+3:end);
                if 1 %isempty(find(this_unit_string==','))
                    this_unit_string=strtrim(this_unit_string);
                    if this_unit_string(end)==';'
                        this_unit_string=this_unit_string(1:end-1);
                    end
                    this_unit_string_comp=split(this_unit_string,' ');
                    nn=length(this_unit_string_comp);
                    this_unit_amount=str2double(this_unit_string_comp{1});
                    if isnan(this_unit_amount)
                        break_var=1;
                        continue
                    end
                    if nn==2
                        this_unit_name=this_unit_string_comp{end};
                    else
                        this_unit_name='';
                        for iix=1:nn-1
                            this_unit_name=[this_unit_name,'-',this_unit_string_comp{iix+1}];
                        end
                    end
                    break;
                end
            end
        end
    end
    if jx==m
        jx=-1;
    end    
    fprintf('%g#%s#%g#%s\n',jx,this_food_item,this_unit_amount,this_unit_name);
end


