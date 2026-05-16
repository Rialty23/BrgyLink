-- Seed dummy records into `tbl_rescert` based on `tbl_resident`
--
-- Notes:
-- - Skips residents that already exist in `tbl_rescert` (by id_resident)
-- - Generates sequential control numbers like TRRESIDENCY-0001, TRRESIDENCY-0002, ...
-- - Generates matching qr_code paths under uploads/qr_codes/
-- - Does NOT generate actual QR PNG files; it only stores the path string.
--
-- Run inside the `bmis` database:
--   USE bmis;
--   SOURCE seed_tbl_rescert.sql;

START TRANSACTION;

SET @prefix := 'TRRESIDENCY-';

SET @next_seq := CAST((
    SELECT IFNULL(
        MAX(CAST(SUBSTRING(control_no, CHAR_LENGTH(@prefix) + 1) AS UNSIGNED)),
        0
    )
    FROM tbl_rescert
    WHERE control_no LIKE CONCAT(@prefix, '%')
) AS UNSIGNED);

INSERT INTO tbl_rescert (
    rejected_reason,
    control_no,
    qr_code,
    cert_no,
    id_resident,
    lname,
    fname,
    mi,
    age,
    nationality,
    occupation,
    contact,
    email,
    houseno,
    street,
    bdate,
    bplace,
    civil_status,
    brgy,
    municipal,
    resident_since,
    date,
    purpose,
    requirements,
    attachment,
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
    IFNULL(t.age, 0) AS age,
    UPPER(IFNULL(NULLIF(TRIM(t.nationality), ''), 'FILIPINO')) AS nationality,
    IFNULL(NULLIF(TRIM(t.occupation), ''),
        ELT(1 + FLOOR(RAND() * 10),
            'VENDOR',
            'DRIVER',
            'STUDENT',
            'TEACHER',
            'FARMER',
            'FISHERFOLK',
            'OFFICE CLERK',
            'SECURITY GUARD',
            'CONSTRUCTION WORKER',
            'UNEMPLOYED'
        )
    ) AS occupation,
    IFNULL(NULLIF(TRIM(t.contact), ''), CONCAT('09', LPAD(t.id_resident, 9, '0'))) AS contact,
    IFNULL(NULLIF(TRIM(t.email), ''), CONCAT('resident', LPAD(t.id_resident, 4, '0'), '@example.com')) AS email,
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
    IFNULL(t.bdate, DATE_SUB(CURDATE(), INTERVAL (18 + MOD(t.id_resident, 60)) YEAR)) AS bdate,
    IFNULL(NULLIF(TRIM(t.bplace), ''),
        ELT(1 + FLOOR(RAND() * 12),
            'MANILA',
            'QUEZON CITY',
            'CEBU CITY',
            'DAVAO CITY',
            'BAGUIO CITY',
            'ILOILO CITY',
            'CAGAYAN DE ORO CITY',
            'BACOLOD CITY',
            'ZAMBOANGA CITY',
            'TAGUIG CITY',
            'ANTIPOLO CITY',
            'GENERAL SANTOS CITY'
        )
    ) AS bplace,
    IFNULL(NULLIF(TRIM(t.status), ''), 'SINGLE') AS civil_status,
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
    ELT(1 + FLOOR(RAND() * 4),
        'Less than 6 months',
        '6 months to 1 year',
        '1-5 years',
        'More than 5 years'
    ) AS resident_since,
    DATE_ADD(CURDATE(), INTERVAL FLOOR(RAND() * 14) DAY) AS date,
    ELT(1 + FLOOR(RAND() * 5),
        'Job/Employment',
        'Business Permit',
        'Postal ID Application',
        'School Requirement',
        'Other important transactions.'
    ) AS purpose,
    ELT(1 + FLOOR(RAND() * 5),
        'Valid ID',
        'Utility Bill',
        'Cedula',
        'Homewowners'' Association Endorsement',
        'Valid ID,Utility Bill'
    ) AS requirements,
    '' AS attachment,
    'PENDING' AS status
FROM (
    SELECT r.*, CAST((@next_seq := @next_seq + 1) AS UNSIGNED) AS seq
    FROM tbl_resident r
    WHERE NOT EXISTS (
        SELECT 1
        FROM tbl_rescert c
        WHERE c.id_resident = r.id_resident
    )
    ORDER BY r.id_resident ASC
    LIMIT 100
) t;

SELECT ROW_COUNT() AS inserted_rows;

COMMIT;
