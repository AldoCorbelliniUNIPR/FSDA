function psi=TBpsi(u,c)
%TBpsi computes psi function (derivative of rho function) for Tukey's biweight  
%
%<a href="matlab: docsearch('tbpsi')">Link to the help function</a>
%
%
%  Required input arguments:
%
%    u:         n x 1 vector containing residuals or Mahalanobis distances
%               for the n units of the sample
%    c :        scalar greater than 0 which controls the robustness/efficiency of the estimator 
%               (beta in regression or mu in the location case ...) 
%
%  Output:
%
%
%   tbpsi :      n x 1 vector which contains the Tukey's psi
%                associated to the residuals or Mahalanobis distances for
%                the n units of the sample
%
% Function psibi transforms vector x as follows 
% TBpsi(x)=
% x[1-(x/c)^2]^2    if |x/c|<=1 
% 0                 if |x/c|>1
% See equation (2.38) p. 29 of Maronna et al. (2006)
%
% Remark: Tukey's biweight  psi-function is almost linear around u = 0 in accordance with
% Winsor's principle that all distributions are normal in the middle.
% This means that  \psi (u)/u is approximately constant over the linear region of \psi,
% so the points in that region tend to get equal weight.
%
%
% References:
%
% ``Robust Statistics, Theory and Methods'' by Maronna, Martin and Yohai;
% Wiley 2006.
%
%
% Copyright 2008-2014.
% Written by FSDA team
%
%
%<a href="matlab: docsearch('tbpsi')">Link to the help page for this function</a>
% Last modified 08-Dec-2013

% Examples:

%{

x=-6:0.01:6;
psiTB=TBpsi(x,2);
plot(x,psiTB)
xlabel('x','Interpreter','Latex')
ylabel('$\psi (x)$','Interpreter','Latex')

%}

%% Beginning of code

psi = (abs(u) < c) .* u .* ( 1 - (u./c).^2 ).^2 ;
end
