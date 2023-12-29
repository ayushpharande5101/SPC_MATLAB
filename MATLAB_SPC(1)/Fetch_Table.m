clc
clearvars
close all
format compact 

clc
clearvars
close all
format compact

databaseName = 'Control';  
username = '';
password = '';
        
conn = database(databaseName, username, password);

        
if isopen(conn)
    disp('Connected to SQL Server database');
else
    error('Failed to connect to SQL Server database');
end
    
query = 'SELECT *FROM Control_chart.dbo.Table_13';

data = fetch(conn,query);

% n = data{:,2:2};

% disp(data)
% disp(n)

i = 1;
j = 1;
x = [];
y = [];
while true

    k = data{i,2};
    disp(k)
    pause(2)
    r = j * 5;
    x = [x,r];
    y = [y,k];
    plot(x,y,'-o','MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k', 'LineWidth', 0.5, 'LineStyle', '-')

    CL = 30;
    UCL = 40;
    LCL = 20;
    USL = 50;
    LSL = 10;
    
    disp(x)
    disp(y)
    
    if k > USL || k < LSL
        hold ('on');
        plot(r, k, 'o' ,'MarkerEdgeColor', 'r', 'MarkerSize', 10,'Color','r'); % points outside control limits
    end
    
%     data = x;y;
%     rng default
%     S = capability(y,[20,30]);
%     disp(S)
    
    yline(UCL, 'LineStyle', "--", 'Color', "g", 'Label', "UCL",LineWidth=1);
    yline(LCL, 'LineStyle', "--", 'Color', "g", 'Label', "LCL",LineWidth=1);
    yline(USL, 'LineStyle', "--", 'Color', "r", 'Label', "USL",LineWidth=1);
    yline(LSL, 'LineStyle', "--", 'Color', "r", 'Label', "LSL",LineWidth=1);
    yline(CL, 'LineStyle', "--", 'Color', "y", 'Label', "CL",LineWidth=0.5);
    
    % LABELS AND LEGENDS
    labels = {'Data', 'OC', 'UCL','LCL','USL','LSL'};
    title("X-bar control chart")
    legend(labels, 'Location', 'northeastoutside', 'FontSize', 10);
    xlabel("Part Id In Integer Format ( 1,2,3 ,4 .....)")
    ylabel("Coating Difference In Real Format (123.12, 456.78 )")
    
    i = i + 1;
    j = j + 1;
    
end