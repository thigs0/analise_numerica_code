using LinearAlgebra

function Cholesky_extern(A)
  
  n,m = size(A)
  s = copy(A)
  G = zeros(n, m)
  
  for i in 1:n-1
    # encontra a diagonal
    G[i, i] = sqrt(A[i, i]);

    # encontra o vetor abaixo da diagonal
    G[i+1:n, i] = A[i+1:n, i]/G[i, i];

    #Corrige a matriz A
    
    A[i+1:n, i+1:n] -= G[i+1:n, 1]*G[i+1:n, 1]';
  end
  
  #calcula o último termo da diagonal
  G[n, n] = s[n, n];
  for i in 1:n-1
    G[n, n] -= G[n, i]^2;
  end
  G[n,n] = sqrt(G[n,n]);

  return G;
end

