SELECT status, COUNT(*) AS total
FROM workspace.dbestudiantes.meta_jobs
GROUP BY status;






SELECT layer, COUNT(*) AS errores
FROM workspace.dbestudiantes.logs_job
WHERE level = 'ERROR'
GROUP BY layer;