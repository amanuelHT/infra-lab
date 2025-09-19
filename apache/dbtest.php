<?php
$envPath = __DIR__ . "/.env";
$env = @parse_ini_file($envPath, false, INI_SCANNER_RAW);


if ($env === false) {
  http_response_code(500);
  die("❌ Could not read .env at $envPath");
}

$dsn = sprintf(
  "host=%s port=%s dbname=%s user=%s password=%s",
  $env['DB_HOST'] ?? '127.0.0.1',
  $env['DB_PORT'] ?? '5432',
  $env['DB_NAME'] ?? 'infralabdb',
  $env['DB_USER'] ?? 'appuser',
  $env['DB_PASS'] ?? ''
);

$conn = @pg_connect($dsn);
if (!$conn) {
  http_response_code(500);
  die("❌ Database connection failed: " . pg_last_error());
}

$sql = "SELECT patientid, name, diagnosis FROM public.patients ORDER BY patientid";
$result = @pg_query($conn, $sql);
if (!$result) {
  http_response_code(500);
  die("❌ Query failed: " . pg_last_error($conn));
}

echo "<h2>Pasientliste</h2><ul>";
while ($row = pg_fetch_assoc($result)) {
  echo "<li>#{$row['patientid']} — " . htmlspecialchars($row['name']) . " — " . htmlspecialchars($row['diagnosis']) . "</li>";
}
echo "</ul>";

pg_close($conn);
