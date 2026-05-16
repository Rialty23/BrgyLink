-- Seed dummy records into `tbl_blotter` based on `tbl_resident`
--
-- Notes:
-- - Generates sequential control numbers like TRBLOTTER-0001, TRBLOTTER-0002, ...
-- - Generates matching qr_code paths under uploads/qr_codes/
-- - Does NOT generate actual QR PNG files; it only stores the path string.
-- - Selects up to 100 residents (random order) and creates 1 blotter entry each.
--
-- Run inside the `bmis` database:
--   USE bmis;
--   SOURCE seed_tbl_blotter.sql;

START TRANSACTION;

SET @prefix := 'TRBLOTTER-';

SET @next_seq := CAST((
    SELECT IFNULL(
        MAX(CAST(SUBSTRING(control_no, CHAR_LENGTH(@prefix) + 1) AS UNSIGNED)),
        0
    )
    FROM tbl_blotter
    WHERE control_no LIKE CONCAT(@prefix, '%')
) AS UNSIGNED);

INSERT INTO tbl_blotter (
    control_no,
    id_resident,
    qr_code,
    case_no,
    lname,
    fname,
    mi,
    age,
    houseno,
    street,
    brgy,
    municipal,
    blot_photo,
    contact,
    narrative,
    timeapplied,
    status,
    rlname,
    rfname,
    rmi,
    rage,
    rcontact,
    raddress,
    type,
    date,
    time,
    location,
    witness
)
SELECT
    CONCAT(@prefix, LPAD(CAST(t.seq AS UNSIGNED), 4, '0')) AS control_no,
    t.id_resident,
    CONCAT('uploads/qr_codes/', CONCAT(@prefix, LPAD(CAST(t.seq AS UNSIGNED), 4, '0')), '.png') AS qr_code,
    IF(RAND() < 0.35, NULL, FLOOR(10000 + RAND() * 90000)) AS case_no,
    t.lname,
    t.fname,
    IFNULL(t.mi, '') AS mi,
    NULLIF(t.age, 0) AS age,
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
    NULL AS blot_photo,
    COALESCE(NULLIF(TRIM(t.contact), ''), CONCAT('09', LPAD(FLOOR(RAND() * 1000000000), 9, '0'))) AS contact,
    ELT(1 + FLOOR(RAND() * 10),
        'Verbal altercation reported in the community.',
        'Noise complaint during late hours.',
        'Property boundary dispute between neighbors.',
        'Minor physical altercation reported.',
        'Harassment complaint filed by complainant.',
        'Threatening statements reported.',
        'Dispute related to unpaid debt.',
        'Vandalism reported by complainant.',
        'Public disturbance reported.',
        'Other complaint requiring barangay mediation.'
    ) AS narrative,
    DATE_SUB(NOW(), INTERVAL FLOOR(RAND() * 30) DAY) AS timeapplied,
    'PENDING' AS status,
    ELT(1 + FLOOR(RAND() * 10),
        'DELA CRUZ',
        'SANTOS',
        'REYES',
        'GARCIA',
        'RAMOS',
        'MENDOZA',
        'BAUTISTA',
        'NAVARRO',
        'VILLAR',
        'FLORES'
    ) AS rlname,
    ELT(1 + FLOOR(RAND() * 10),
        'JUAN',
        'MARIA',
        'JOSE',
        'ANA',
        'PAOLO',
        'LIZA',
        'CARLO',
        'MARK',
        'ROSE',
        'JANE'
    ) AS rfname,
    ELT(1 + FLOOR(RAND() * 10),
        'A',
        'B',
        'C',
        'D',
        'E',
        'F',
        'G',
        'H',
        'I',
        'J'
    ) AS rmi,
    FLOOR(18 + RAND() * 60) AS rage,
    CONCAT('09', LPAD(FLOOR(RAND() * 1000000000), 9, '0')) AS rcontact,
    CONCAT(
        FLOOR(1 + RAND() * 9999),
        ' ',
        ELT(1 + FLOOR(RAND() * 10),
            'Rizal Ave',
            'Bonifacio St',
            'Mabini St',
            'Del Pilar St',
            'Quezon Ave',
            'Taft Ave',
            'JP Rizal St',
            'National Highway',
            'Osmeña Blvd',
            'Roxas Blvd'
        )
    ) AS raddress,
    -- `type` in your table is the complaint text
    ELT(1 + FLOOR(RAND() * 8),
        'VERBAL ABUSE',
        'PHYSICAL INJURY',
        'THEFT',
        'VANDALISM',
        'NOISE COMPLAINT',
        'HARASSMENT',
        'THREAT',
        'PUBLIC DISTURBANCE'
    ) AS type,
    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 3650) DAY) AS date,
    SEC_TO_TIME(FLOOR(RAND() * 86400)) AS time,
    ELT(1 + FLOOR(RAND() * 10),
        'NEAR BARANGAY HALL',
        'PUBLIC MARKET',
        'MAIN ROAD',
        'COMMUNITY CENTER',
        'BASKETBALL COURT',
        'SCHOOL AREA',
        'TERMINAL',
        'NEAR CHAPEL',
        'NEAR RIVERBANK',
        'RESIDENTIAL AREA'
    ) AS location,
    ELT(1 + FLOOR(RAND() * 8),
        'NONE',
        'NEIGHBOR',
        'BARANGAY TANOD',
        'RELATIVE',
        'FRIEND',
        'PASSERBY',
        'STORE OWNER',
        'SECURITY GUARD'
    ) AS witness
FROM (
    SELECT r.*, CAST((@next_seq := @next_seq + 1) AS UNSIGNED) AS seq
    FROM tbl_resident r
    ORDER BY RAND()
    LIMIT 100
) t;

SELECT ROW_COUNT() AS inserted_rows;

COMMIT;
