function data = load_data(filename, idx_sheet)
%% Function Description:
% ��excel����ȡ���ݣ������ٶȺ�λ������
% ���з�����ׯ��վ-->�μ�ׯ����14վ��13��
% [Status,Sheets,Format] = xlsfinfo(file);

%% main
    [~, Sheet, ~] = xlsfinfo(filename);  % ��ȡ�����Ϣ

    V = []; S = [];slope = [];

    if (nargin<2)  % ��ָ��idx_sheet������£���ȡ����sheet
        for i = 1:length(Sheet)
            NUM = xlsread(filename, Sheet{i});
            V = [V; NUM(:, 6)];  % �ٶ�
            S = [S; NUM(:, 10)];  % λ��
            slope = [slope; NUM(:, 16)];  % �¶�
        end
        data = [V, S-40665.104, slope];
    else  % ָ��idx_sheet������£���ȡָ����sheet
        NUM = xlsread(filename, Sheet{idx_sheet});
        V = NUM(:, 6);  % �ٶ�
        S = NUM(:, 9);  % λ��
        slope = NUM(:, 16);  % �¶�
        data = [V, S, slope];
    end
%     save DataMat data
end