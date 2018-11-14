function Lab10_ListOfFunctions()


[NUM, TXT, RAW] = xlsread('C:\Users\Vanessa5\Google Drive\Oxy 2018 Fall\CogS 242\Labs\VisData.xlsx', 'Data', 'A4:G99');
X = RAW(:, [1,2,3,4,5,7])
RAW = X
[nrows, ncols] = size(RAW)
row_indices = num2cell(1:nrows)'
X = [row_indices RAW]
RAW = X
C = {'Row', 'Trial', 'Display', 'Target', 'SetSize', 'RT', 'Outlier'}
DataTable = cell2table(RAW, 'VariableNames', C)
CA = DataTable{[1:24], {'SetSize', 'RT'}}
good_rows = DataTable{ [1:24], 'Outlier'} == false
good_a = CA(good_rows, :)
CA_table = DataTable([1:24], {'SetSize', 'RT'})
good_rows = DataTable{[1:24], 'Outlier'} == false
good_CA_table = CA_table(good_rows,:)

CP = DataTable{[24:48], {'SetSize', 'RT'}}
good_rows = DataTable{ [25:48], 'Outlier'} == false
CP_table = DataTable([25:48], {'SetSize', 'RT'})
good_CP_table = CP_table(good_rows,:)

CA_data = fitlm(CA_table)
good_CA_data = fitlm(good_CA_table)
CP_data = fitlm(CP_table)
good_CP_data = fitlm(good_CP_table)


