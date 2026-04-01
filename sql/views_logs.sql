-- ============================================================
-- VISTA: vw_logs
-- Descripción:
--   Vista estandarizada para consultar los logs del pipeline.
--   Se usa en el dashboard para analizar errores, actividad
--   por capa y mensajes recientes.
-- ============================================================

CREATE OR REPLACE VIEW workspace.dbestudiantes.vw_logs AS
SELECT
    log_time,
    job_name,
    layer,
    level,
    message
FROM workspace.dbestudiantes.logs_job;
