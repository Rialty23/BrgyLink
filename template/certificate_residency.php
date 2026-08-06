<?php
$certificateVariant = $certificateVariant ?? 'residency';

function loadCertificateRecord($variant)
{
    $sources = [
        'residency' => ['parameter' => 'id_rescert', 'table' => 'tbl_rescert', 'column' => 'id_rescert'],
        'indigency' => ['parameter' => 'id_indigency', 'table' => 'tbl_indigency', 'column' => 'id_indigency'],
        'business' => ['parameter' => 'id_bspermit', 'table' => 'tbl_bspermit', 'column' => 'id_bspermit'],
        'clearance' => ['parameter' => 'id_clearance', 'table' => 'tbl_clearance', 'column' => 'id_clearance'],
    ];

    if (!isset($sources[$variant])) {
        return [];
    }

    $source = $sources[$variant];
    $id = filter_input(INPUT_GET, $source['parameter'], FILTER_VALIDATE_INT);
    if (!$id) {
        return [];
    }

    require __DIR__ . '/../classes/conn.php';
    $query = "SELECT document.*, resident.sex AS resident_sex,
                     resident.status AS resident_civil_status
              FROM {$source['table']} document
              LEFT JOIN tbl_resident resident ON document.id_resident = resident.id_resident
              WHERE document.{$source['column']} = ?";
    $statement = $conn->prepare($query);
    $statement->execute([$id]);

    return $statement->fetch(PDO::FETCH_ASSOC) ?: [];
}

function templateValue($key, $default)
{
    return htmlspecialchars(trim($_GET[$key] ?? $default), ENT_QUOTES, 'UTF-8');
}

function ordinalDay($day)
{
    $day = (int) $day;
    if ($day % 100 >= 11 && $day % 100 <= 13) {
        return $day . 'th';
    }

    return $day . match ($day % 10) {
        1 => 'st',
        2 => 'nd',
        3 => 'rd',
        default => 'th',
    };
}

$certificateRecord = loadCertificateRecord($certificateVariant);
if ($certificateRecord) {
    $recordName = trim(($certificateRecord['fname'] ?? '') . ' ' . ($certificateRecord['mi'] ?? '') . ' ' . ($certificateRecord['lname'] ?? ''));
    $recordAddress = trim(implode(', ', array_filter([
        $certificateRecord['houseno'] ?? '',
        $certificateRecord['street'] ?? '',
        $certificateRecord['brgy'] ?? '',
        $certificateRecord['municipal'] ?? '',
    ])));
    $recordSex = strtolower($certificateRecord['sex'] ?? $certificateRecord['resident_sex'] ?? '');

    $_GET += [
        'name' => $recordName,
        'address' => $recordAddress,
        'civil_status' => $certificateRecord['civil_status'] ?? $certificateRecord['resident_civil_status'] ?? '',
        'residency' => $certificateRecord['resident_since_2'] ?? $certificateRecord['resident_since'] ?? '',
        'purpose' => $certificateRecord['purpose'] ?? '',
        'issue_date' => $certificateRecord['date'] ?? $certificateRecord['date_issued'] ?? '',
        'serial_number' => $certificateRecord['cert_no'] ?? $certificateRecord['control_no'] ?? '',
        'trade_name' => $certificateRecord['bsname'] ?? '',
        'business_kind' => $certificateRecord['bsindustry'] ?? '',
        'pronoun' => $recordSex === 'male' ? 'his' : ($recordSex === 'female' ? 'her' : 'his/her'),
        'subject_pronoun' => $recordSex === 'male' ? 'he' : ($recordSex === 'female' ? 'she' : 'he/she'),
    ];
}

$issueTimestamp = strtotime($_GET['issue_date'] ?? '') ?: time();
$paymentTimestamp = strtotime($_GET['payment_date'] ?? '') ?: $issueTimestamp;
$residentName = templateValue('name', '(NAME)');
$address = templateValue('address', '(ADDRESS)');
$civilStatus = templateValue('civil_status', 'married');
$residencyLength = templateValue('residency', '(HOW MANY YEARS)');
$purpose = templateValue('purpose', 'whatever legal purpose it may serve');
$punongBarangay = templateValue('punong_barangay', 'PETER Gyayo BUCASAN');
$serialNumber = templateValue('serial_number', '1701355');
$pronoun = templateValue('pronoun', 'his/her');
$subjectPronoun = templateValue('subject_pronoun', 'he/she');
$tradeName = templateValue('trade_name', '(DTI NAME)');
$businessKind = templateValue('business_kind', '(KIND OF BUSINESS)');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Barangay Certification</title>
    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            background: #e7e9ec;
            color: #292929;
            font-family: "Times New Roman", Times, serif;
        }

        .print-actions {
            width: 210mm;
            margin: 18px auto 10px;
            text-align: right;
        }

        .print-button {
            border: 0;
            border-radius: 6px;
            padding: 10px 22px;
            background: #176c36;
            color: #fff;
            font: 600 14px Arial, sans-serif;
            cursor: pointer;
        }

        .certificate {
            position: relative;
            width: 210mm;
            margin: 0 auto 24px;
            overflow: hidden;
            background: #fff;
            box-shadow: 0 4px 18px rgba(0, 0, 0, 0.18);
        }

        .header-wave {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 38mm;
            object-fit: fill;
            z-index: 0;
        }

        .header {
            position: relative;
            z-index: 2;
            display: grid;
            grid-template-columns: 30mm 1fr 30mm;
            align-items: start;
            padding: 7mm 19mm 0;
            text-align: center;
        }

        .seal {
            width: 27mm;
            height: 27mm;
            border-radius: 50%;
            object-fit: contain;
        }

        .seal.right { justify-self: end; }

        .government-heading {
            padding-top: 1mm;
            font-size: 10pt;
            font-weight: bold;
            line-height: 1.12;
            letter-spacing: 0.5px;
        }

        .government-heading .barangay {
            font-size: 12pt;
            letter-spacing: 1.4px;
        }

        .content {
            position: relative;
            z-index: 1;
            padding: 10mm 29mm 31mm;
            font-size: 12pt;
            line-height: 1.45;
        }

        .document-title {
            margin: 5mm 0 13mm;
            color: #8fcbd8;
            font-family: Arial, sans-serif;
            font-size: 19pt;
            font-weight: 800;
            text-align: center;
            text-transform: uppercase;
            text-shadow: 0 1px 0 #d9eef2;
        }

        .salutation {
            margin-bottom: 7mm;
            font-weight: bold;
        }

        .body-copy {
            position: relative;
            text-align: justify;
            text-indent: 13mm;
        }

        .body-copy p { margin: 0 0 5mm; }

        .business-document {
            padding-top: 7mm;
            font-size: 10.5pt;
            line-height: 1.28;
        }

        .business-document .document-title {
            margin: 3mm 0 7mm;
            font-size: 18pt;
        }

        .business-document .body-copy {
            text-indent: 0;
        }

        .business-document .body-copy p {
            margin-bottom: 3mm;
        }

        .business-conditions {
            margin: 2mm 0 3mm 7mm;
            padding-left: 7mm;
        }

        .business-conditions li {
            margin-bottom: 3mm;
            padding-left: 3mm;
        }

        .business-document .signature-area {
            margin-top: 7mm;
        }

        .business-document .attested {
            margin-top: 5mm;
        }

        .business-document .official {
            margin-top: 8mm;
        }

        .business-document .stamp-box {
            margin-top: 9mm;
        }

        .clearance-seal-row {
            display: flex;
            justify-content: flex-end;
            margin: 9mm 7mm 0 0;
        }

        .filled {
            font-weight: bold;
            text-decoration: underline;
            text-transform: uppercase;
        }

        .watermark {
            position: absolute;
            z-index: -1;
            left: 50%;
            top: 56mm;
            width: 130mm;
            opacity: 0.12;
            transform: translateX(-50%) rotate(-8deg);
        }

        .date-line { text-indent: 13mm; }

        .signature-area {
            display: grid;
            grid-template-columns: 1fr 34mm;
            gap: 16mm;
            align-items: end;
            margin-top: 13mm;
        }

        .resident-signature {
            width: 66mm;
            padding-top: 17mm;
            border-bottom: 1px solid #222;
            text-align: center;
        }

        .signature-label {
            width: 66mm;
            padding-top: 1mm;
            font-size: 10pt;
            text-align: center;
        }

        .dry-seal {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 29mm;
            height: 29mm;
            border: 1px solid #aaa;
            border-radius: 50%;
            color: #555;
            font: 7pt/1.15 Arial, sans-serif;
            text-align: center;
        }

        .attested { margin-top: 8mm; }

        .official {
            width: 74mm;
            margin-top: 13mm;
            text-align: center;
        }

        .official-name {
            font-size: 12pt;
            font-weight: bold;
        }

        .official-position { font-size: 10pt; }

        .stamp-box {
            display: grid;
            grid-template-columns: 1fr 1fr;
            width: 90mm;
            margin-top: 16mm;
            padding: 3mm 5mm 2mm;
            border: 1px solid #333;
            font-size: 9pt;
            text-align: center;
        }

        .stamp-title {
            grid-column: 1 / -1;
            margin-bottom: 5mm;
            font-weight: bold;
        }

        .stamp-value {
            font-weight: bold;
            text-decoration: underline;
        }

        .stamp-caption {
            display: block;
            margin-top: 1mm;
            font-size: 7pt;
            font-weight: bold;
        }

        .footer {
            position: absolute;
            right: 15mm;
            bottom: 8mm;
            left: 15mm;
            z-index: 2;
            padding-top: 3mm;
            border-top: 2px solid #2b873e;
            color: #555;
            font: 8pt Arial, sans-serif;
            text-align: center;
        }

        .contact-row {
            display: flex;
            justify-content: center;
            gap: 7mm;
            margin-top: 1.5mm;
        }

        .contact-item {
            display: inline-flex;
            align-items: center;
            gap: 1.5mm;
        }

        .contact-icon {
            width: 4mm;
            height: 4mm;
            object-fit: contain;
            filter: grayscale(1);
        }

        @page { size: A4 portrait; margin: 0; }

        @media print {
            body { background: #fff; }
            .print-actions { display: none; }
            .certificate {
                margin: 0;
                box-shadow: none;
                page-break-after: avoid;
            }
        }
    </style>
</head>
<body>
    <div class="print-actions">
        <button type="button" class="print-button" onclick="window.print()">Print Certificate</button>
    </div>

    <main class="certificate">
        <img class="header-wave" src="header-of-template.jpg" alt="">

        <header class="header">
            <img class="seal" src="city-of-bagiuo.jpg" alt="City of Baguio seal">
            <div class="government-heading">
                Republic of the Philippines<br>
                <span class="barangay">EAST MODERN SITE BARANGAY</span><br>
                Aurora Hill, Baguio City<br>
                District XIX
            </div>
            <img class="seal right" src="eastmodern.jpg" alt="East Modern Site Barangay seal">
        </header>

        <section class="content <?= $certificateVariant === 'business' ? 'business-document' : '' ?>">
            <img class="watermark" src="watermark-of-template.jpg" alt="">
            <h1 class="document-title">
                <?php if ($certificateVariant === 'business'): ?>
                    Barangay Business Clearance
                <?php elseif ($certificateVariant === 'clearance'): ?>
                    Barangay Clearance
                <?php else: ?>
                    Barangay Certification
                <?php endif; ?>
            </h1>

            <div class="salutation">TO WHOM IT MAY CONCERN:</div>

            <div class="body-copy">
                <?php if ($certificateVariant === 'clearance'): ?>
                    <p>
                        This is to certify that <span class="filled"><?= $residentName ?></span>, of legal age and
                        <?= $civilStatus ?>, is a bona fide resident of <span class="filled"><?= $address ?></span>.
                    </p>

                    <p>
                        This is to further certify that, based on the available records of this office as of this date,
                        <?= $subjectPronoun ?> has <strong>no derogatory record</strong> on file in this barangay.
                    </p>

                    <p>
                        This is also to certify that the above-mentioned person has been residing in this barangay for
                        <span class="filled"><?= $residencyLength ?></span>.
                    </p>

                    <p>
                        This certification is issued upon <?= $pronoun ?> verbal request for
                        <span class="filled"><?= $purpose ?></span> and for whatever legal intent and purposes it may serve.
                    </p>
                <?php elseif ($certificateVariant === 'business'): ?>
                    <p>
                        Pursuant to the provision of Republic Act 3883, as amended by Republic Act 4147 and Republic
                        Act No. 861, and in compliance with the applicable rule and regulation as prescribed by the
                        Department of Trade and Industry, Baguio City.
                    </p>

                    <p>This is to certify that:</p>

                    <ol class="business-conditions">
                        <li>
                            The Business Permit of <span class="filled"><?= $residentName ?></span>, covering the
                            business establishment located at <span class="filled"><?= $address ?></span>, is within
                            the jurisdiction of the Barangay.
                        </li>
                        <li>
                            The clearance being applied for is for a new business permit with the tradename
                            <span class="filled"><?= $tradeName ?></span>, in the line of business of
                            <span class="filled"><?= $businessKind ?></span>.
                        </li>
                        <li>
                            The business establishment is not within the following:<br>
                            Road Right of Way<br>
                            Creek Assessment<br>
                            CALT<br>
                            Forest/Watershed/Safeguarded Lands<br>
                            Identified City/Barangay Needs
                        </li>
                        <li>The establishment is within 100 meters from a school.</li>
                        <li>
                            The undersigned recommends approval of the business being applied for because it does not
                            violate any existing laws or ordinances of the City of Baguio and the Barangay.
                        </li>
                    </ol>

                    <p>
                        This Clearance is issued to <span class="filled"><?= $residentName ?></span> in support of
                        <?= $pronoun ?> application for a New Business Permit.
                    </p>

                    <p>
                        Provided, however, that the Fire Code and cleanliness program of the City Government, as well
                        as the Barangay, shall be strictly complied with.
                    </p>
                <?php elseif ($certificateVariant === 'indigency'): ?>
                    <p>
                        This is to certify that <span class="filled"><?= $residentName ?></span>, of legal age, is a
                        bona fide resident of <span class="filled"><?= $address ?></span>.
                    </p>

                    <p>
                        This is to further certify that the above-mentioned individual has been residing in our
                        barangay for <span class="filled"><?= $residencyLength ?></span>. This is to certify further
                        that <?= $subjectPronoun ?> is one of those who belong to low-income families in our barangay.
                        This certification is issued upon <?= $pronoun ?> request for financial assistance and for
                        whatever legal purpose it may serve.
                    </p>
                <?php else: ?>
                    <p>
                        This is to certify that <span class="filled"><?= $residentName ?></span>, of legal age,
                        <?= $civilStatus ?>, is a bona fide resident of <span class="filled"><?= $address ?></span>
                        whose signature appears hereunder, has no derogatory record against <?= $pronoun ?> in this
                        barangay as per available file with this office as of this date.
                    </p>

                    <p>
                        This is to certify further that the above-mentioned individual has been residing in this
                        barangay for <span class="filled"><?= $residencyLength ?></span>. This certification is issued
                        upon <?= $pronoun ?> verbal request for <span class="filled"><?= $purpose ?></span>.
                    </p>
                <?php endif; ?>
            </div>

            <?php if ($certificateVariant === 'business'): ?>
                <p class="date-line">
                    Issued this <span class="filled"><?= ordinalDay(date('j', $issueTimestamp)) ?></span> day of
                    <span class="filled"><?= date('F Y', $issueTimestamp) ?></span> at the East Modern Site Barangay.
                </p>
            <?php else: ?>
                <p class="date-line">
                    Given this <span class="filled"><?= ordinalDay(date('j', $issueTimestamp)) ?></span> day of
                    <span class="filled"><?= date('F Y', $issueTimestamp) ?></span> at the East Modern Site Barangay
                    Multi-purpose Hall, P. Ledesma Street, Aurora Hill, Baguio City, Philippines.
                </p>
            <?php endif; ?>

            <?php if ($certificateVariant === 'clearance'): ?>
                <div class="clearance-seal-row">
                    <div class="dry-seal">Not valid<br>without<br>official seal</div>
                </div>
            <?php else: ?>
                <div class="signature-area">
                    <div>
                        <div class="resident-signature"></div>
                        <div class="signature-label">Signature over Printed Name</div>
                    </div>
                    <div class="dry-seal">Not valid<br>without<br>official seal</div>
                </div>
            <?php endif; ?>

            <div class="attested">Attested by:</div>
            <div class="official">
                <div class="official-name"><?= $punongBarangay ?></div>
                <div class="official-position">Punong Barangay</div>
            </div>

            <div class="stamp-box">
                <div class="stamp-title">“DOCUMENTARY STAMP PAID”</div>
                <div>
                    <span class="stamp-value"><?= $serialNumber ?></span>
                    <span class="stamp-caption">(GOR SERIAL NUMBER)</span>
                </div>
                <div>
                    <span class="stamp-value"><?= date('F d, Y', $paymentTimestamp) ?></span>
                    <span class="stamp-caption">(DATE OF PAYMENT)</span>
                </div>
            </div>
        </section>

        <footer class="footer">
            P. Ledesma Street, Purok 1, East Modern Site Barangay, Aurora Hill, Baguio City
            <div class="contact-row">
                <span class="contact-item">
                    <img class="contact-icon" src="email.jpg" alt="Email">
                    barangayeastmodernsite@gmail.com
                </span>
                <span class="contact-item">
                    <img class="contact-icon" src="contact.jpg" alt="Telephone">
                    422-2528
                </span>
            </div>
        </footer>
    </main>
</body>
</html>
