using LinearAlgebra

function Cholesky(A, ispositive=false)
  #= A é a matriz com dimensão nxn que iremos decompor
   ispositive é um booleano que diz se o usuário sabe previamente se a matriz é definida positiva ou não (True, false)=#
  
  #Verificamos se o usuário sabe previamente que a matriz é definida positiva
  if ispositive == true
    n,m = size(A);
    
    if n != m
      error("A matriz não é quadrada")
    end
    
    G = zeros(n,n);
    
    #resolve para a primeira coluna
    G[1,1] = sqrt(A[1,1]);
    for i in 2:n
      G[i, 1] = A[i, 1]/G[1, 1];
    end

    # Itera para as próximas

    for i in 2:n

      #calcula os outros termos
      for j in 2:i-1
        G[i,j] = A[i, j];
        for k in 1:j-1
          G[i, j] -=G[i, k]*G[j, k];
        end
        G[i,j] /= G[j, j]
      end

      # calcula para a diagonal
      G[i, i] = A[i,i];
      for j in 1:i-1
        G[i,i] -= (G[i,j])^2
      end
      G[i,i] = sqrt(G[i,i])
    end

    return G;

  else 
    n,m = size(A);
    
    if n != m
      error("A matriz não é quadrada")
    end
    
    G = zeros(n,n);
    
    #resolve para a primeira coluna
    if A[1,1] <=0
      error("A matriz não é definida positiva")
    end

    G[1,1] = sqrt(A[1,1]);
    for i in 2:n
      G[i, 1] = A[i, 1]/G[1, 1];
    end

    # Itera para as próximas

    for i in 2:n

      #calcula os outros termos
      for j in 2:i-1
        G[i,j] = A[i, j];
        for k in 1:j-1
          G[i, j] -=G[i, k]*G[j, k];
        end

        if G[j,j] == 0 
          error("A matriz não é definida positiva")
        end

        G[i,j] /= G[j, j]
      end

      # calcula para a diagonal
      G[i, i] = A[i,i];
      for j in 1:i-1
        G[i,i] -= (G[i,j])^2
      end

      if G[i,i] <=0 
        error("A matriz não é definida positiva")
      end

      G[i,i] = sqrt(G[i,i])
    end

    return G;

  end
end
