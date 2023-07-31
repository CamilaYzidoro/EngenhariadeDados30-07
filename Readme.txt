Neste desafio, decidi fazer uma arquitetura Cloud baseada em Azure pois estou estudando a mesma.

Os dados enviados pelo cliente seriam inclusos no Azure Blob Storage, o Azure Databricks seria utilizado para realizar o ETL e os dados serão carregados para o Azure SQL, podendo assim serem utilizados para a criação de um visual em Power BI ou Power Apps para consulta do usuário final.

Optei por utilizar o Azure Blob Storage por ser de fácil utilização. O Azure Databricks por ser um produto com a possibilidade de utilizarmos várias linguagens, como por exemplo o Python, Scala e R. O Azure SQL por ser um produto baseado em SQL Server e ser de fácil entendimento e ter uma interface web de fácil utilização.
Optei por uma arquitetura simples porém eficiente.

Para implementarmos essa arquitetura, primeiro precisaremos realizar a liberação dos recursos da arquitetura explicada acima, após isso, os passos seguintes são:

 - Acessar o Azure Blob Storage->opção: Contêiner, criaremos uma pasta (pode ser do tipo Private) com o nome camilayzidoro e carregaremos os arquivos da pasta CSV contidos neste repositório, na pasta criada.
 
 - Acessar o Microsoft Azure SQL Database, acessá-lo e carregar o script ScriptCriacaoTabelaseSchemas.sql contidos na pasta Scripts neste repositório e executar o mesmo (clicando no botão Run). Desta forma os Schemas e Tabelas serão criados.

 - Acessar o Azure Databricks, clicar no botão Workspace, clicar na seta ao lado direito da opção ou clicar com o lado direito do mouse em qualquer lugar da tela, selecionar a opção Import, virá marcado com a opção File (Arquivo), clicar em browser e carregar o arquivo ETLArquivos.ipynb contido na pasta ETL deste repositório e clicar em Import. Após o carregamento do arquivo, abrir o arquivo importado e clicar em Run All para executar todas as células deste arquivo para realizar.
Obs: Em algumas partes do código, como por exemplo a conexão com o BD, será necessário incluir o nome dos BD criado no passo anterior ou as chaves(Key) do repositório.

 - Por último, baixar o ScriptAnalisedeDados.sql contido na pasta Scripts neste repositório e executá-lo na Base de Dados criada para verificar o Resultado das seguintes análises:
  1. Escreva uma query que retorna a quantidade de linhas na tabela Sales.SalesOrderDetail pelo campo SalesOrderID, desde que tenham pelo menos três linhas de detalhes. 
  2. Escreva uma query que ligue as tabelas Sales.SalesOrderDetail, Sales.SpecialOfferProduct e Production.Product e retorne os 3 produtos (Name) mais vendidos (pela soma de OrderQty), agrupados pelo número de dias para manufatura (DaysToManufacture).
  3. Escreva uma query ligando as tabelas Person.Person, Sales.Customer e Sales.SalesOrderHeader de forma a obter uma lista de nomes de clientes e uma contagem de pedidos efetuados.
  4. Escreva uma query usando as tabelas Sales.SalesOrderHeader, Sales.SalesOrderDetail e Production.Product, de forma a obter a soma total de produtos (OrderQty) por ProductID e OrderDate.
  5. Escreva uma query mostrando os campos SalesOrderID, OrderDate e TotalDue da tabela Sales.SalesOrderHeader. Obtenha apenas as linhas onde a ordem tenha sido feita durante o mês de setembro/2011 e o total devido esteja acima de 1.000. Ordene pelo total devido decrescente.

É importante resaltar que enquanto eu realizava a verificação dos dados nos arquivos enviados, alguns arquivos tinham mais resultados do que nomes de colunas no cabeçalho. Como não havia como confirmar do que se tratavam os dados ou qual eram os nomes das colunas, eu optei por eliminá-las.