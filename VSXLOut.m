function VSXLOut (VSData, filename)
    sheet = 1;
    Title = {'Visual Search Data', '', VSData.Subject, VSData.DateTime};
    xlswrite(filename, Title, sheet, 'A1')
    
    Headings = {'DisplayType','TargetPresent', 'N_Distract', 'TargetSeen', 'ResponseTime'};
    xlswrite(filename, Headings, sheet, 'A2')
    
    for k = 1:100
        DisplayType = VSData.Observations(k, 1);
        TargetPresent = VSData.Observations(k, 2);
        N_Distract = VSData.Observations(k, 3);
        TargetSeen = VSData.Observations(k, 4);
        ResponseTime = VSData.Observations(k, 5);
        if DisplayType == 0
             xlswrite(filename, {'feature'}, sheet, "A" + int2str(k + 2))
        else
             xlswrite(filename, {'conjunction'}, sheet, "A" + int2str(k + 2))
        end
        if TargetPresent == 0
             xlswrite(filename, {'absent'}, sheet, "B" + int2str(k + 2))
        else
             xlswrite(filename, {'present'}, sheet, "B" + int2str(k + 2))
        end
        xlswrite(filename, N_Distract, sheet, "C" + int2str(k + 2))
        if TargetSeen == 0
            xlswrite(filename, {'no'}, sheet, "D" + int2str(k + 2))
        else
            xlswrite(filename, {'yes'}, sheet, "D" + int2str(k + 2))
        end
        xlswrite(filename, ResponseTime, sheet, "E" + int2str(k + 2))
    end
end

    