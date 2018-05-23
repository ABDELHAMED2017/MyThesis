function [p_safty, v_safty] = trans2safty_line(p_limit, v_limit, L)
%% parameters:
% p_limit, �������ߵĺ�����
% v_limit, �������ߵ�������
% L���г�����
% posi, ��ȫ�������ߵĺ�����
% v_safty����ȫ�������ߵ�������

%% trans2safty_line

p_safty = zeros(size(p_limit));
v = v_limit(2:2:end);

for i = 1: length(v)-1
   if i == 1  % ��һ������
       if v(i) < v(i+1)
           p_safty(2*i-1) = p_limit(2*i-1);
           p_safty(2*i) = p_limit(2*i) + L;
       else
           p_safty(2*i-1) = p_limit(2*i-1);
           p_safty(2*i) = p_limit(2*i) - L;
       end
    
   else  %% �м����䣨��������һ�������һ�����䣩
       if v(i)>v(i-1) && v(i)>v(i+1)  %% �͸ߵ�
           p_safty(2*i-1) = p_limit(2*i-1) + L;
           p_safty(2*i) = p_limit(2*i) - L;
       elseif v(i)>v(i-1) && v(i)<v(i+1)  %% ��������
           p_safty(2*i-1) = p_limit(2*i-1) + L;
           p_safty(2*i) = p_limit(2*i) + L;
       elseif v(i)<v(i-1) && v(i)>v(i+1)  % �����½�
           p_safty(2*i-1) = p_limit(2*i-1);
           p_safty(2*i) = p_limit(2*i) - L;
       elseif v(i)<v(i-1) && v(i)<v(i+1)  %% �ߵ͸�
           p_safty(2*i-1) = p_limit(2*i-1);
           p_safty(2*i) = p_limit(2*i) + L;
       end
              
   end
    
end

% ���һ������
i = length(v);
if v(i) < v(i-1)  % �ߵ�
   p_safty(2*i-1) = p_limit(2*i-1);
   p_safty(2*i) = p_limit(2*i);
else  % �͸�
   p_safty(2*i-1) = p_limit(2*i-1) + L;
   p_safty(2*i) = p_limit(2*i);
end

v_safty = v_limit - 2;

end