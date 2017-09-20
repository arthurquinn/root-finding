function N11_est = Est_MLE(n11,n12,n21,n22,M1,M2,N,iter)

    N11_est = zeros(iter,1);
    
    %First iteration uses Margin-Free Estimator
    N11_est(1) = (n11/(n11+n12+n21+n22))*N;
    
    for i = 2:iter
        
        %Get previous iteration N11
        N11 = N11_est(i-1);
        
        %Calculate g(N_11)
        gn11 = n11/N11 - n12/(M1-N11) - n21/(M2-N11) + n22/(N-M1-M2+N11);
        
        %Calculate g'(N_11)
        gpn11 = -n11/power(N11,2) - n12/power(M1-N11,2) - n21/power(M2-N11,2) - n22/power(N-M1-M2+N11,2);
        
        %Calculate new N11_est
        N11_est(i) = N11 - gn11/gpn11;
        
    end
    
end

