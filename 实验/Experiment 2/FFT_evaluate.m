clear;
close all;

fftNstart = 1; % 2^
fftNend = 11; % 2^
simTime = 1; % sec
error_th = 1e-4; % error threshold

CurrID = input('Student ID = ','s');

count = zeros(length(fftNstart:fftNend),1);

for i=fftNstart:fftNend
    
    fftN = 2^i;
    
    time = 0;
    
    count_temp = 0;
    
    while(time < simTime)
        
        x = randn(1,fftN) + 1j*randn(1,fftN);
        tic;
        eval(['X=myFFT_' CurrID '(x,fftN);']);
        time = time + toc;
        count_temp = count_temp + 1;
        
        % result check
        X_accu = fft(x,fftN);
        error_result = sum(abs(X_accu - X));
        if(error_result > error_th)
            disp(['Error = ' num2str(error_result)]);
            error('Error too large.');
        end
        
    end
    
    count(i-fftNstart+1) = fftN*log2(fftN)*count_temp;
    
end

score = ceil(sum(count)/100000);
fprintf('Score = %d\n\n',score);
