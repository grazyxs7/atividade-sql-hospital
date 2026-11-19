SELECT 
    conv.nome AS convenio,
    SUM(c.valor) AS faturamento_total
FROM consultas c
INNER JOIN convenios conv ON c.id_convenio = conv.id_convenio
WHERE conv.nome LIKE '%Saúde%'
GROUP BY conv.nome;


SELECT 
    m.especialidade,
    AVG(c.valor) AS media_valor_consulta
FROM consultas c
INNER JOIN medicos m ON c.id_medico = m.id_medico
WHERE m.especialidade LIKE '%Cardiologia%'
GROUP BY m.especialidade;


SELECT 
    q.tipo AS tipo_quarto,
    AVG(i.valor_diaria) AS valor_medio_diaria
FROM internacoes i
INNER JOIN quartos q ON i.id_quarto = q.id_quarto
WHERE q.tipo IN ('Apartamento', 'UTI')
GROUP BY q.tipo;


SELECT 
    m.nome AS medico,
    SUM(c.valor) AS soma_total_consultas
FROM consultas c
INNER JOIN medicos m ON c.id_medico = m.id_medico
WHERE c.status IN ('Realizada', 'Finalizada')
GROUP BY m.nome;


SELECT 
    p.nome AS paciente,
    SUM(i.valor_diaria) AS soma_acumulada_diarias
FROM internacoes i
INNER JOIN pacientes p ON i.id_paciente = p.id_paciente
WHERE p.nome LIKE '%Silva%'
GROUP BY p.nome;


SELECT 
    c.status AS status_consulta,
    COUNT(pr.id_prescricao) AS total_medicamentos_prescritos
FROM prescricoes pr
INNER JOIN consultas c ON pr.id_consulta = c.id_consulta
WHERE pr.medicamento LIKE '%Dipirona%' 
   OR pr.medicamento LIKE '%Paracetamol%'
GROUP BY c.status;


SELECT 
    conv.nome AS convenio,
    m.especialidade,
    AVG(c.valor) AS media_valor_consulta
FROM consultas c
INNER JOIN convenios conv ON c.id_convenio = conv.id_convenio
INNER JOIN medicos m ON c.id_medico = m.id_medico
WHERE conv.nome LIKE '%Unimed%'
GROUP BY conv.nome, m.especialidade;


SELECT 
    conv.nome AS convenio,
    AVG(i.valor_diaria) AS media_diaria_uti
FROM internacoes i
INNER JOIN convenios conv ON i.id_convenio = conv.id_convenio
INNER JOIN quartos q ON i.id_quarto = q.id_quarto
WHERE q.tipo = 'UTI'
GROUP BY conv.nome;


SELECT 
    m.nome AS medico,
    COUNT(pr.id_prescricao) AS total_itens_prescritos
FROM prescricoes pr
INNER JOIN consultas c ON pr.id_consulta = c.id_consulta
INNER JOIN medicos m ON c.id_medico = m.id_medico
WHERE c.status = 'Realizada'
GROUP BY m.nome;


SELECT 
    p.nome AS paciente,
    SUM(c.valor) AS valor_total_gasto,
    AVG(c.valor) AS media_valor_consulta
FROM consultas c
INNER JOIN pacientes p ON c.id_paciente = p.id_paciente
WHERE p.nome LIKE 'M%'
GROUP BY p.nome;