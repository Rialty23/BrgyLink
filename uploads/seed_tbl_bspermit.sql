-- Seed ~100 dummy records into `tbl_bspermit` based on `tbl_resident`
--
-- Notes:
-- - Skips residents that already exist in `tbl_bspermit` (by id_resident)
-- - Generates sequential control numbers like TRBSPERMIT-0001, TRBSPERMIT-0002, ...
-- - Generates matching qr_code paths under uploads/qr_codes/
--
-- Run inside the `bmis` database:
--   USE bmis;
--   SOURCE seed_tbl_bspermit.sql;

START TRANSACTION;

SET @prefix := 'TRBSPERMIT-';

SET @next_seq := CAST((
    SELECT IFNULL(
        MAX(CAST(SUBSTRING(control_no, CHAR_LENGTH(@prefix) + 1) AS UNSIGNED)),
        0
    )
    FROM tbl_bspermit
    WHERE control_no LIKE CONCAT(@prefix, '%')
) AS UNSIGNED);

INSERT INTO tbl_bspermit (
    rejected_reason,
    control_no,
    qr_code,
    cert_no,
    id_resident,
    lname,
    fname,
    mi,
    contact,
    email,
    bcode,
    age,
    bsname,
    houseno,
    street,
    brgy,
    municipal,
    bsindustry,
    aoe,
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
    IFNULL(t.contact, CONCAT('09', LPAD(t.id_resident, 9, '0'))) AS contact,
    IFNULL(t.email, CONCAT('resident', LPAD(t.id_resident, 4, '0'), '@example.com')) AS email,
    CONCAT('BCODE-', LPAD(t.id_resident, 6, '0')) AS bcode,
    IFNULL(t.age, 0) AS age,
    CONCAT('BS ', t.lname, ' ', t.fname) AS bsname,
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
        CONCAT('Brgy. ', ELT(1 + FLOOR(RAND() * 12),
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
        ))
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
    CASE MOD(t.id_resident, 5)
        WHEN 0 THEN 'Retail'
        WHEN 1 THEN 'Food'
        WHEN 2 THEN 'Electronics'
        WHEN 3 THEN 'Services'
        ELSE 'Construction'
    END AS bsindustry,
    20 + MOD(t.id_resident, 81) AS aoe,
    'PENDING' AS status
FROM (
    SELECT r.*, CAST((@next_seq := @next_seq + 1) AS UNSIGNED) AS seq
    FROM tbl_resident r
    WHERE NOT EXISTS (
        SELECT 1
        FROM tbl_bspermit b
        WHERE b.id_resident = r.id_resident
    )
    ORDER BY r.id_resident ASC
    LIMIT 100
) t;

SELECT ROW_COUNT() AS inserted_rows;

COMMIT;
