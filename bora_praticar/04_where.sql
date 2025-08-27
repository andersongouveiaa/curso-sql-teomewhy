-- Selecione produtos que contêm ‘churn’ no nome

SELECT * 

FROM produtos

--where DescProduto LIKE '%churn%'


WHERE DescProduto IN ('Churn_10pp', 'Churn_20pp', 'Churn_30pp')

