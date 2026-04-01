-- ============================================================
-- VISTA: vw_meta
-- Descripción:
--   Vista estandarizada para consultar metadatos de ejecución
--   de cada job del pipeline. Se usa para visualizar:
--     - estado de jobs
--     - filas procesadas
--     - último id_ingesta
--     - tiempos de ejecución
-- ============================================================

CREATE OR REPLACE VIEW workspace.dbestudiantes.vw_meta AS
SELECT
    job_name,
    layer,
    start_time,
    end_time,
    rows,
    id_ingesta_last,
    status
FROM workspace.dbestudiantes.meta_jobs;
