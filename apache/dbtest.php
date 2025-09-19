<?php
$dsn = "host=127.0.0.1 port=5432 dbname=infralabdb user=appuser password=InfraLab!123";
$conn = pg_connect($dsn);
if (!$conn) {
  die("❌ Database connection failed: " . pg_last_error());
}

$result = pg_query($conn, "SELECT patientid, name, diagnosis FROM patients ORDER BY patientid");
if (!$result) {
  die("❌ Query failed: " . pg_last_error($conn));
}

echo "<h2>Pasientliste</h2><ul>";
while ($row = pg_fetch_assoc($result)) {
  echo "<li>#{$row['patientid']} — " . htmlspecialchars($row['name']) . " — " . htmlspecialchars($row['diagnosis']) . "</li>";
}
echo "</ul>";

pg_close($conn);
