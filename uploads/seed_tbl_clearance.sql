-- Seed dummy records into `tbl_clearance` based on `tbl_resident`
--
-- Notes:
-- - Skips residents that already exist in `tbl_clearance` (by id_resident)
-- - Generates sequential control numbers like TRBRGYCLEARANCE-0001, TRBRGYCLEARANCE-0002, ...
-- - Generates matching qr_code paths under uploads/qr_codes/
-- - Does NOT generate actual QR PNG files; it only stores the path string.
--
-- Run inside the `bmis` database:
--   USE bmis;
--   SOURCE seed_tbl_clearance.sql;

START TRANSACTION;

SET @prefix := 'TRBRGYCLEARANCE-';

SET @next_seq := CAST((
    SELECT IFNULL(
        MAX(CAST(SUBSTRING(control_no, CHAR_LENGTH(@prefix) + 1) AS UNSIGNED)),
        0
    )
    FROM tbl_clearance
    WHERE control_no LIKE CONCAT(@prefix, '%')
) AS UNSIGNED);

INSERT INTO tbl_clearance (
    rejected_reason,
    control_no,
    qr_code,
    cert_no,
    id_resident,
    lname,
    fname,
    mi,
    purpose,
    houseno,
    street,
    brgy,
    municipal,
    status,
    age,
    sex,
    bdate,
    bplace,
    occupation,
    employment_status,
    precinct_no,
    resident_since,
    company_name,
    ref_name1,
    ref_name2,
    ref_tel,
    clearance_type,
    date_issued,
    status2
)
SELECT
    '' AS rejected_reason,
    CONCAT(@prefix, LPAD(CAST(t.seq AS UNSIGNED), 4, '0')) AS control_no,
    CONCAT('uploads/qr_codes/', CONCAT(@prefix, LPAD(CAST(t.seq AS UNSIGNED), 4, '0')), '.png') AS qr_code,
    NULL AS cert_no,
    t.id_resident,
    t.lname,
    t.fname,
    IFNULL(t.mi, '') AS mi,
    ELT(1 + FLOOR(RAND() * 8),
        'Employment Requirement',
        'Business Requirement',
        'School Requirement',
        'Loan Application',
        'Police Clearance Requirement',
        'Water/Electric service Connection',
        'Travel Requirement',
        'Other important transactions.'
    ) AS purpose,
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
    -- `status` here matches your sample (civil status like Engaged/Married/etc.)
    IFNULL(NULLIF(TRIM(t.status), ''), 'SINGLE') AS status,
    IFNULL(t.age, 0) AS age,
    IFNULL(NULLIF(TRIM(t.sex), ''), ELT(1 + FLOOR(RAND() * 2), 'Male', 'Female')) AS sex,
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
    ELT(1 + FLOOR(RAND() * 4), 'Employed', 'Self-Employed', 'Unemployed', 'Student') AS employment_status,
    CONCAT('P-', LPAD(FLOOR(1 + RAND() * 9999), 4, '0')) AS precinct_no,
    -- `resident_since` column appears DATE in your sample
    DATE_SUB(CURDATE(), INTERVAL FLOOR(30 + RAND() * 3650) DAY) AS resident_since,
    ELT(1 + FLOOR(RAND() * 8),
        'ABC TRADING',
        'GOLDEN HARVEST STORE',
        'BAYANI SERVICES',
        'SUNRISE EATERY',
        'LUNA CONSTRUCTION',
        'SAMPAGUITA ENTERPRISES',
        'MAHARLIKA MART',
        'ISLA LOGISTICS'
    ) AS company_name,
    ELT(1 + FLOOR(RAND() * 10),
        'JUAN DELA CRUZ',
        'MARIA SANTOS',
        'JOSE REYES',
        'ANA GARCIA',
        'PAOLO CRUZ',
        'LIZA RAMOS',
        'CARLO BAUTISTA',
        'MARK NAVARRO',
        'ROSE VILLAR',
        'JANE FLORES'
    ) AS ref_name1,
    ELT(1 + FLOOR(RAND() * 10),
        'PEDRO DELA CRUZ',
        'SOFIA SANTOS',
        'MIGUEL REYES',
        'GRACE GARCIA',
        'ANDRES CRUZ',
        'CLARA RAMOS',
        'ANTONIO BAUTISTA',
        'LUIS NAVARRO',
        'ELIZABETH VILLAR',
        'FERNANDO FLORES'
    ) AS ref_name2,
    CONCAT('09', LPAD(FLOOR(RAND() * 1000000000), 9, '0')) AS ref_tel,
    ELT(1 + FLOOR(RAND() * 2), 'NEW', 'RENEW') AS clearance_type,
    NOW() AS date_issued,
    'PENDING' AS status2
FROM (
    SELECT r.*, CAST((@next_seq := @next_seq + 1) AS UNSIGNED) AS seq
    FROM tbl_resident r
    WHERE NOT EXISTS (
        SELECT 1
        FROM tbl_clearance c
        WHERE c.id_resident = r.id_resident
    )
    ORDER BY r.id_resident ASC
    LIMIT 100
) t;

SELECT ROW_COUNT() AS inserted_rows;

COMMIT;
