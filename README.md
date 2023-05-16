GNU nano 4.8                               README.md                                            
# analise_numerica_code
Códigos desenvolvidos em júlia para a matéria de análise numérica na unicamp.
os códigos no geral têm uma breve explicação para implementações e leves tratamentos de erros.

Sempre desenvolvidos em **Julia**

**Cholesky**

    → Cholesky.jl
      Função Cholesky,
      parametros:
      A → é a matriz que você deseja decompor em G
      ispositive → é boolean que infoma se você sabe se a matriz é definida positiva
      Retorna a matriz G

    → Cholesky_ExternProduct.jl
      Função chamada Cholesky_extern,
      parametros:
      A → é a matriz que queremos queremos gerar G
      Retorna a matriz G

**QR**

    → QR_Givens.jl
      Função QR_Givens,
      parametros:
      A → é a matriz que decompomos na $Q^t$

      Retorna a matriz Q transposta

    → QR_Householder.jl
        Função Householder
        parametros:
        A → é a matrix que decompomos na Q
        SIGMA → é um boolean que dez se retorna o vetor dos sigmas ou não
        
        Retorna a matriz Q e R
