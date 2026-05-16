-- Seed dummy records into `tbl_indigency` based on `tbl_resident`
--
-- Notes:
-- - Skips residents that already exist in `tbl_indigency` (by id_resident)
-- - Generates sequential control numbers like TRINDIGENCY-0001, TRINDIGENCY-0002, ...
-- - Generates matching qr_code paths under uploads/qr_codes/
-- - Does NOT generate actual QR PNG files; it only stores the path string.
-- - Purpose values match your `services_certofindigency.php` <select> option values.
--
-- Run inside the `bmis` database:
--   USE bmis;
--   SOURCE seed_tbl_indigency.sql;

START TRANSACTION;

SET @prefix := 'TRINDIGENCY-';

SET @next_seq := CAST((
    SELECT IFNULL(
        MAX(CAST(SUBSTRING(control_no, CHAR_LENGTH(@prefix) + 1) AS UNSIGNED)),
        0
    )
    FROM tbl_indigency
    WHERE control_no LIKE CONCAT(@prefix, '%')
) AS UNSIGNED);

INSERT INTO tbl_indigency (
    rejected_reason,
    control_no,
    qr_code,
    cert_no,
    id_resident,
    lname,
    fname,
    mi,
    bdate,
    age,
    nationality,
    houseno,
    street,
    brgy,
    municipal,
    resident_since,
    purpose,
    date,
    status
)
SELECT
    '' AS rejected_reason,
    CONCAT(@prefix, LPAD(CAST(t.seq AS UNSIGNED), 4, '0')) AS control_no,
    CONCAT('uploads/qr_codes/', CONCAT(@prefix, LPAD(CAST(t.seq AS UNSIGNED), 4, '0')), '.png') AS qr_code,
    '' AS cert_no,
    t.id_resident,
    t.lname,
    t.fname,
    IFNULL(t.mi, '') AS mi,
    IFNULL(t.bdate, DATE_SUB(CURDATE(), INTERVAL (18 + MOD(t.id_resident, 60)) YEAR)) AS bdate,
    IFNULL(t.age, 0) AS age,
    COALESCE(NULLIF(TRIM(t.nationality), ''), 'Filipino') AS nationality,
    COALESCE(NULLIF(TRIM(t.houseno), ''), CONCAT(FLOOR(1 + RAND() * 9999))) AS houseno,
    COALESCE(
        NULLIF(TRIM(t.street), ''),
        ELT(1 + FLOOR(RAND() * 12),
            'Rizal Ave',
            'Bonifacio St',
            'Mabini St',
            'Del Pilar St',
            'Quezon Ave',
            'Taft Ave',
            'EDSA',
            'Osmeña Blvd',
            'Roxas Blvd',
            'MacArthur Hwy',
            'National Highway',
            'JP Rizal St'
        )
    ) AS street,
    COALESCE(
        NULLIF(TRIM(t.brgy), ''),
        ELT(1 + FLOOR(RAND() * 12),
            'Poblacion',
            'San Isidro',
            'San Roque',
            'San Jose',
            'Santo Niño',
            'Santa Cruz',
            'Maligaya',
            'Bagong Silang',
            'Pulang Lupa',
            'San Antonio',
            'San Miguel',
            'Sta. Maria'
        )
    ) AS brgy,
    COALESCE(
        NULLIF(TRIM(t.municipal), ''),
        ELT(1 + FLOOR(RAND() * 20),
            'Manila',
            'Quezon City',
            'Cebu City',
            'Davao City',
            'Baguio City',
            'Iloilo City',
            'Cagayan de Oro City',
            'Bacolod City',
            'Zamboanga City',
            'Taguig City',
            'Pasig City',
            'Makati City',
            'Antipolo City',
            'Cabanatuan City',
            'Santiago City',
            'Cauayan City',
            'Ilagan City',
            'General Santos City',
            'Calamba City',
            'Puerto Princesa City'
        )
    ) AS municipal,
    DATE_SUB(CURDATE(), INTERVAL FLOOR(30 + RAND() * 3650) DAY) AS resident_since,
    ELT(1 + FLOOR(RAND() * 5),
        'Job/Employment',
        'Business Establishment',
        'Financial Transaction',
        'Scholarship',
        'Other important transactions.'
    ) AS purpose,
    DATE_ADD(CURDATE(), INTERVAL FLOOR(RAND() * 14) DAY) AS date,
    'PENDING' AS status
FROM (
    SELECT r.*, CAST((@next_seq := @next_seq + 1) AS UNSIGNED) AS seq
    FROM tbl_resident r
    WHERE NOT EXISTS (
        SELECT 1
        FROM tbl_indigency i
        WHERE i.id_resident = r.id_resident
    )
    ORDER BY r.id_resident ASC
    LIMIT 100
) t;

SELECT ROW_COUNT() AS inserted_rows;

COMMIT;
