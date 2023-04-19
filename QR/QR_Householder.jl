using LinearAlgebra

function Househouder(A)
  #= A é a matrix que queremos a r
    
  Return: Retorna a função q que retaciona o sistema
=#
  n,m = size(A);
  if (n!=m)
    error("A matriz não é quadrada")
  end

  qt = Matrix{Float64}(I,n,n); # Aqui iremos salvar as transformações
  
  for i in 1:n-1 # Percore as n-1 colunas
    q = Matrix{Float64}(I,n,n);
    x = A[i:end, i];
    y = zeros(n-i+1); # corigimos por começar no 1
    y[1] = -sign(x[1])*norm(x);
    u = x-y

    q[i:end, i:end] = I(n-i+1) - (2/(norm(u)^2))*u*u'
    qt = q*qt; #Atualizamos onde é salvo a nossa q
    A = q*A; #Atualizamos o problema que queremos rotacionar
  end

  return qt;
end
