#####Algunas consultas como respaldo#####
SELECT 
  w_solicitud_diseno.id,
  IF(
    w_proceso_requisito_diseno.donde_se_disena = 't',
    'Toluca',
    'Cuernavaca'
  ) AS Planta,
  IF(
    MAX(evento) = 117,
    'Modificación',
    'Original'
  ) AS 'Tipo',
  IF(
    w_proceso_requisito_diseno.num_material IS NULL,
    'Sin material',
    w_proceso_requisito_diseno.num_material
  ) AS 'Material',
  w_solicitud_diseno.simbolo,
  cliente.razonSocial,
  w_datos_tarjeta_diseno.revision,
  IF(
    w_solicitud_diseno.d_m = 1,
    'Diseño',
    'Muestra'
  ) AS 'DM',
  fecha_sol_cliente,
  propuesta,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 101)) AS FechaCliente1,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento IN (102, 113))) AS FechaVendedor,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 106)) AS FechaJefeDiseno,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 104)) AS FechaRechazoJDV,
  (SELECT 
    w_aviso_diseno.comentarios 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 104)) AS ComentarioRechazoJDV,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 107)) AS FechaDisenador1,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 105)) AS FechaRechazoD1V,
  (SELECT 
    w_aviso_diseno.comentarios 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 105)) AS ComentarioRechazoD1V,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 109)) AS FechaDisenador2,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 108)) AS FechaRechazoD2D,
  (SELECT 
    w_aviso_diseno.comentarios 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 108)) AS ComentarioRechazoD2D,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 112)) AS FechaClliente2,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 110)) AS FechaRechazoCD,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 111)) AS FechaRechazoCV,
  (SELECT 
    w_aviso_diseno.comentarios 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 111)) AS ComentariosRechazoCV,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 115)) AS FechaRM,
  (SELECT 
    w_aviso_diseno.comentarios 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 115)) AS ComentariosRM,
  (SELECT 
    w_aviso_diseno.fecha_revisado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 114 
      AND evento NOT IN (115))) AS FechaAM,
  (SELECT 
    usuario.nombre 
  FROM
    usuario 
    INNER JOIN w_aviso_diseno 
      ON usuario.id = w_aviso_diseno.idde 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE w_aviso_diseno.id_requisito = w_solicitud_diseno.id 
      AND w_aviso_diseno.evento = 102)) AS EjecutivoVentas,
  (SELECT 
    usuario.nombre 
  FROM
    usuario 
    INNER JOIN w_aviso_diseno 
      ON usuario.id = w_aviso_diseno.idde 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE w_aviso_diseno.id_requisito = w_solicitud_diseno.id 
      AND w_aviso_diseno.evento = 107)) AS Disenador,
  (SELECT 
    w_aviso_diseno.fecha_enviado 
  FROM
    w_aviso_diseno 
  WHERE w_aviso_diseno.id = 
    (SELECT 
      MAX(w_aviso_diseno.id) 
    FROM
      w_aviso_diseno 
    WHERE id_requisito = w_solicitud_diseno.id 
      AND evento = 116)) AS cdd 
FROM
  w_solicitud_diseno 
  INNER JOIN w_aviso_diseno 
    ON w_aviso_diseno.id_requisito = w_solicitud_diseno.id 
  LEFT JOIN w_proceso_requisito_diseno 
    ON w_proceso_requisito_diseno.id = w_solicitud_diseno.id 
  INNER JOIN w_requisito_diseno 
    ON w_requisito_diseno.id = w_proceso_requisito_diseno.id 
  INNER JOIN cliente 
    ON w_solicitud_diseno.id_cliente = cliente.id 
  LEFT JOIN w_datos_tarjeta_diseno 
    ON w_datos_tarjeta_diseno.id = w_solicitud_diseno.id 
WHERE w_solicitud_diseno.fecha_creacion BETWEEN '2019-01-01' 
  AND '2020-01-01' 
GROUP BY w_solicitud_diseno.id 
############################################################
SELECT 
  w_requisito_diseno.*,
  w_proceso_requisito_diseno.diseno_padre,
  cliente.razonSocial,
  COUNT(
    w_complemento_diseno.id_requisito
  ) AS NumComplemetos,
  usuario.nombre,
  IF(
    cliente.plantadisenadora = 't',
    'Toluca',
    'Cuernavaca'
  ) AS donde_se_disena,
  w_solicitud_diseno.fecha_creacion,
  w_requisito_rack.id_requisito,
  w_requisito_rack.largo,
  w_requisito_rack.ancho,
  w_requisito_rack.fondo,
  combinacion.flauta AS CFlauta,
  combinacion.grado AS cGrado,
  CONCAT(
    combinacion.grado,
    ' ',
    combinacion.resistencia
  ) AS Cresistencia,
  IF(
    combinacion.papel = 'K',
    'KRAFT',
    IF(
      combinacion.papel = 'B',
      'BLCO',
      combinacion.papel
    )
  ) AS Cpapel,
  IF(
    combinacion.recubrimiento = '0',
    'NA',
    IF(
      combinacion.recubrimiento = '1',
      'RI',
      combinacion.recubrimiento
    )
  ) AS Crecubrimiento,
  IF(
    combinacion.pegamento = '1',
    'Agricola',
    IF(
      combinacion.pegamento = '0',
      'Industrial',
      IF(
        combinacion.pegamento = 'AGR',
        'Agricola',
        IF(
          combinacion.pegamento = 'IND',
          'Industrial',
          combinacion.pegamento
        )
      )
    )
  ) AS Cpegamento,
  (SELECT 
    CONCAT(id, '*', gama, '*', clave) 
  FROM
    color 
  WHERE id = w_requisito_diseno.tinta1) AS tintarequisito1,
  (SELECT 
    CONCAT(id, '*', gama, '*', clave) 
  FROM
    color 
  WHERE id = w_requisito_diseno.tinta2) AS tintarequisito2,
  (SELECT 
    CONCAT(id, '*', gama, '*', clave) 
  FROM
    color 
  WHERE id = w_requisito_diseno.tinta3) AS tintarequisito3,
  (SELECT 
    CONCAT(id, '*', gama, '*', clave) 
  FROM
    color 
  WHERE id = w_requisito_diseno.tinta4) AS tintarequisito4,
  (SELECT 
    CONCAT(id, '*', gama, '*', clave) 
  FROM
    color 
  WHERE id = w_requisito_diseno.tinta5) AS tintarequisito5,
  (SELECT 
    CONCAT(id, '*', gama, '*', clave) 
  FROM
    color 
  WHERE id = w_requisito_diseno.tinta6) AS tintarequisito6 
FROM
  w_requisito_diseno 
  INNER JOIN cliente 
    ON w_requisito_diseno.id_cliente = cliente.id 
  LEFT JOIN w_complemento_diseno 
    ON w_requisito_diseno.id = w_complemento_diseno.id_requisito 
  INNER JOIN w_proceso_requisito_diseno 
    ON w_requisito_diseno.id = w_proceso_requisito_diseno.id 
  INNER JOIN w_solicitud_diseno 
    ON w_requisito_diseno.id = w_solicitud_diseno.id 
  INNER JOIN combinacion 
    ON combinacion.id = w_requisito_diseno.combinacion 
  INNER JOIN usuario 
    ON w_proceso_requisito_diseno.agente_ventas = usuario.id 
  LEFT JOIN w_requisito_rack 
    ON w_requisito_diseno.id = w_requisito_rack.id_requisito 
WHERE w_requisito_diseno.id = 8569 
############################################################
SELECT 
  w_solicitud_diseno.id,
  cliente.razonSocial,
  w_solicitud_diseno.simbolo,
  IF(
    w_solicitud_diseno.d_m = 1,
    'Diseño',
    'Muestra'
  ) AS tipo_proceso,
  usuario.nombre,
  w_solicitud_diseno.fecha_creacion 
FROM
  w_solicitud_diseno 
  INNER JOIN cliente 
    ON cliente.id = w_solicitud_diseno.id_cliente 
  INNER JOIN usuario 
    ON usuario.id = cliente.vendedorAsignado 
  INNER JOIN w_tipo_embalaje 
    ON w_tipo_embalaje.id = w_solicitud_diseno.id_tipo_embalaje 
  INNER JOIN w_proceso_requisito_diseno 
    ON w_proceso_requisito_diseno.id = w_solicitud_diseno.id 
  INNER JOIN w_requisito_diseno 
    ON w_requisito_diseno.id = w_solicitud_diseno.id 
  INNER JOIN w_asignacion_diseno 
    ON w_asignacion_diseno.id_requisito = w_solicitud_diseno.id 
WHERE fecha_jefediseno IS NULL 
  AND aprobado_rechazado_jefediseno IS NULL 
  AND w_asignacion_diseno.planta = 't' 
  AND w_solicitud_diseno.d_m = 1 
ORDER BY w_solicitud_diseno.id ASC 