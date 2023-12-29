clc
clearvars
close all
format compact 

i = 1;
while i<=10

    databaseName = 'Control';  
    username = '';
    password = '';
        
    conn = database(databaseName, username, password);
        
    if isopen(conn)
        disp('Connected to SQL Server database');
    else
        error('Failed to connect to SQL Server database');
    end

    currentDatetime = datetime('now', 'Format', 'yyyy-MM-dd HH:mm:ss');
    
    query = 'SELECT * FROM SPC_DATALOG.dbo.Table_2';
    data = fetch(conn,query);
    disp(data)

    a = randi([1, 10]);
    b = randi([5, 60]);
    c = randn();
    d = randn();
    e = randn();
    f = randn();
%     g = randn();
    
    sqlQuery = ['INSERT INTO SPC_DATALOG.dbo.Table_13 (Part_Id, Dosing_Weight, UCL,LCL, USL, LSL) ', ...
                'VALUES (''',num2str(a), ''', ', num2str(b), ', ', num2str(c), ', ', 	num2str(d), ', ', ...
                num2str(e), ', ', num2str(f), ')'];
    

    exec(conn, sqlQuery);

    close(conn)
    i=i+1;
    pause(2)
end