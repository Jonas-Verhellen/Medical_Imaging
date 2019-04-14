%% PLOTS
FF = figure;

loglog(1:NLandweber,Error_Landweber,1:NConjGrad,Error_Conjugate_Gradient,1:NML,Error_ML_EM)
title('Risiduals')
xlabel('Iteration number')
ylabel('Risidual norm')
legend('Error Landweber', 'Error Conjugate Gradient', 'Error ML EM')

FF = figure;
loglog(1:NConjGrad,[chi_squared_Conjugate_Gradient,maximum_diff_Conjugate_Gradient, correlation_Conjugate_Gradient],1:NML,[chi_squared_ML_EM, maximum_diff_ML_EM, correlation_ML_EM])
title('Image comparison')
xlabel('Iteration number')
ylabel('Value')
legend('chi squared Conjugate Gradient', 'maximum difference Conjugate Gradient', 'correlation Conjugate Gradient' ,'chi squared ML EM', 'maximum difference ML EM', 'correlation ML EM' )

