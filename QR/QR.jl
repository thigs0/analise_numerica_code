using LinearAlgebra

function QR_Givens(A)

  function Q(l,j,c,s,n)
    #Já gera a matriz transposta de Givens
    i = Matrix{Float64}(I,n,n);
    i[l, l] = c;
    i[j, j] = c;
    i[j, l] = s;
    i[l, j] = -s;
    return i
  end

  A=copy(A); #gera uma cópia que iremos modificar
  n,m = size(A);
  if n != m
    error("A matriz não é quadrada")
  end
  
  q = I(n);
  for j in 1:n #percorre as colunas
   for i in j+1:n #percorre as linhas
    t1 = A[j, j];
    t2 = A[i, j];
    k = sqrt(t1^2 +t2^2)
    c = t1/k;
    s = t2/k;
    t = Q(i,j,c,s,n) # função que gera a matriz de rotação com termos seno e cosseno
    q = t*q;
    A = t*A;
    end
  end
  return q;
end

