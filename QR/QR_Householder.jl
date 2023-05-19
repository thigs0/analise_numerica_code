using LinearAlgebra
function Householder(A, SIGMA::Bool = false)
  #= A::array é a matrix que queremos a r e ela tem posto cheio
    
  SIGMA::bool é um verificador se ele deve retornar o valor daos sigmas como um vetor ou não
  Return: Retorna a matriz R triangular superior e a função Q que rotaciona o sistema
=#

  n,m = size(A); #Obtemos a quantidade de linhas e colunas
  if (n < m) # Verifica posto
    error("A matriz não tem posto cheio")
  end

  sigma = zeros(m); #Armazenar os valores de sigma
  Q = Matrix{Float64}(I,n,n); # Aqui iremos salvar as transformações
  aux = zeros(n,m); # Aqui iremos salvar os u

  for i in 1:m-1 # Percore as m-1 colunas
    if (i != 1)
      #Zeramos a linha da matriz A
      for j in 1:i-1
         A[j:end, i] = A[j:end, i] - (2/(norm(aux[j:end, j])^2))*aux[j:end, j]*aux[j:end, j]'*A[j:end, i]
         Q[j:end, i] = Q[j:end, i] - (2/(norm(aux[j:end, j])^2))*aux[j:end, j]*aux[j:end, j]'*Q[j:end, i]
      end 
    end

    x = A[i:end, i];
    sigma[i] = -sign(x[1])*norm(x);

    x[1] = x[1]-sigma[i];
    aux[i:end, i] = x;

    A[i:end, i] = A[i:end, i] - (2/(norm(aux[i:end, i])^2))*aux[i:end, i]*aux[i:end, i]'*A[i:end, i]
    Q[i:end, i] = Q[i:end, i] - (2/(norm(aux[i:end, i])^2))*aux[i:end, i]*aux[i:end, i]'*Q[i:end, i]

  end

  #Rotacionamos a ultima coluna
  for j in 1:m-1
    A[j:end, m] = A[j:end, m] - (2/(norm(aux[j:end, j])^2))*aux[j:end, j]*aux[j:end, j]'*A[j:end, m]
    Q[j:end, m] = Q[j:end, m] - (2/(norm(aux[j:end, j])^2))*aux[j:end, j]*aux[j:end, j]'*Q[j:end, m]
  end 

  if (n > m) # Temos que zerar as linhas a mais
    x = A[m:end, m];
    sigma[m] = -sign(x[1])*norm(x);

    x[1] = x[1]-sigma[m];
    aux[m:end, m] = x;
    A[m:end, m] = A[m:end, m] - (2/(norm(aux[m:end, m])^2))*aux[m:end, m]*aux[m:end, m]'*A[m:end, m];
    Q[m:end, m] = Q[m:end, m] - (2/(norm(aux[m:end, m])^2))*aux[m:end, m]*aux[m:end, m]'*Q[m:end, m];
  else
    if (SIGMA == false)
    return Q, A;
    else
      return Q, A, sigma[1:n-1]
    end
  end

  if (SIGMA == false)
    return Q, A;
  else
    return Q, A, sigma[1:n]
  end
end
