%% ******* Function description *****************
%   �����г�ǣ���ƶ����ߣ�AW0��
%% **********************************************
clear all
clc
v = 0:0.1:90;
a = 0;
b = 51.5;
c = 90;
d = 77;
%% ǣ����f
f = (v >= a & v <= b) .* 203 + (v > b & v <= c) .* ...
    (-0.002032 .* power(v, 3) + 0.4928 .* power(v, 2)-42.12 .* v + 1343);
%% �ƶ���b
b = 166 .* (v >= a & v <= d) + (v > d & v <= c) .* ...
    (0.134 .* power(v, 2) - 25.07 .* v + 1300);
%% ��������
f0 = 2.031 + 0.0622 .* power(v, 1) + 0.0018 .* power(v, 2);
%%  Plot
plot(v, f, '-.b', 'linewidth',2);
hold on
plot(v, b, '--r', 'linewidth',2);
hold on
plot(v, f0, ':k', 'linewidth',2);
axis([0 90 0 230]);
%% ��ͨģʽ
xlabel('Velocity (km/h)');
ylabel('Force (KN)');
legend('Maximum Traction Force', 'Maximum Braking Force', 'Basic Resistance');
%% Latexģʽ
% xlabel('$Speed(km/h)$','interpreter','latex');
% ylabel('$Force(KN)$','interpreter','latex');
% h=legend('$$Maximum\ Traction \ Force$$', '$$Maximum\ Braking\ Force$$', '$$Basic\ Resistance$$');
% set(h,'interpreter','latex')
%% ��ӱ�ע
% text('Interpreter','latex','String','$F_{max}$','Position',[30 210],'FontSize',13);
% text('Interpreter','latex','String','$B_{max}$','Position',[30 160],'FontSize',13);
% text('Interpreter','latex','String','$F_0$','Position',[60 20],'FontSize',13);


