function N11_est = Est_IPS(n11,n12,n21,n22,M1,M2,N,iter)

    N11_est = zeros(iter,1);

    for i = 1:iter
        %Align row margins
        n11 = (M1/(n11+n12))*n11;
        n12 = M1 - n11;
        
        R = N-(n11+n12);
        r = n21+n22;
        n21 = (n21/r)*R;
        n22 = (n22/r)*R;        
        
        %Align column margins
        n11 = (M2/(n11+n21))*n11;
        n21 = M2 - n11;
        
        R = N-(n11+n21);
        r = n12+n22;
        n12 = (n12/r)*R;
        n22 = (n22/r)*R;
        
        %Set N11_est for this iter
        N11_est(i) = n11;
    end

end

