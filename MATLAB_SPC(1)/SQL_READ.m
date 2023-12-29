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

tablename = 'SPC_DATALOG.dbo.Table_2';
data = sqlread(conn, tablename);

disp(data)
