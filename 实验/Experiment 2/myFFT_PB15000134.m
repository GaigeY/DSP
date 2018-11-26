function y = myFFT_PB15000134(x,N)
%x: 输入序列， 行向量。
%N: DFT 点数。
%X: 输出序列，长度为 N，行向量

nx = 0:N-1;
nx = nx';
j1 = N/2;
    for i1 = 1:N-1 
        if i1<j1
            temp = nx(j1+1);
            nx(j1+1) = nx(i1+1);
            nx(i1+1) = temp;
        end
        k = N/2;
        while(j1>=k)
            j1 = j1-k;
            k = k/2;
        end
        if j1<k
           j1 = j1+k;
        end
    end

y = x(nx+1);    %将倒序排列作为的初始值

m = log2(N);
for mm = 1:m                    %将DFT做m次基2分解，从左到右，对每次分解作DFT运算
    Nmr = 2^mm;
    u = 1;                      %旋转因子u初始化
    WN = exp(-1i*2*pi/Nmr);     %本次分解的基本DFT因子WN＝exp(-i*2*pi/Nmr)
    for k1 = 1:Nmr/2            %本次跨越间隔内的各次碟形运算，次数由1->2->4->8->...
        for kp1 = k1:Nmr:N      %本次碟形运算的跨越间隔为Nmr=2^mm 
            kp2 = kp1+Nmr/2;    %确定碟形运算的对应单元下标
            t = y(kp2)*u;       %碟形运算的乘积项
            y(kp2) = y(kp1)-t;  %碟形运算的加法项
            y(kp1) = y(kp1)+t;  %放回原来的下表位置
        end
        u = u*WN;               %修改旋转因子，多乘一个基本DFT因子WN
    end
end

end