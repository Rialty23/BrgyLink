<?php
error_reporting(E_ALL);
include('classes/resident.class.php');
require('classes/conn.php');
// require  '/../phpqrcode/qrlib.php';
$userdetails = $bmis->get_userdata();

$dt = new DateTime("now", new DateTimeZone('Asia/Manila'));
$cdate = $dt->format('Y/m/d');

include_once './dbcon.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Barangay Link</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Poppins font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- FontAwesome -->
    <script src="https://kit.fontawesome.com/67a9b7069e.js" crossorigin="anonymous"></script>

    <!-- Swiper Carousel -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <style>
        nav {
            z-index: 50;
            /* or higher than 10 */
        }

        body {
            font-family: 'Poppins', sans-serif;
            scroll-behavior: smooth;
        }

        .zoom:hover {
            transform: scale(1.05);
            transition: transform .3s;
        }

        .card-hover:hover {
            transform: scale(1.03);
            transition: transform .3s;
        }

        .truncate-lines {
            display: -webkit-box;
            -webkit-line-clamp: 6;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .announcement-img {
            max-height: 150px;
            object-fit: cover;
            border-radius: 8px;
        }

        .expandable-content {
            transition: max-height 0.3s ease;
            overflow: auto;
            padding-top: 1rem;
            /* optional */
        }

        @media (max-width: 640px) {
            .swiper-button-next,
            .swiper-button-prev {
                display: none;
            }
        }
    </style>
</head>

<body class="bg-gray-100">

    <!-- Navbar -->
    <nav class="bg-blue-700 text-white sticky top-0 shadow-md">
        <div class="container mx-auto flex flex-wrap items-center justify-between gap-3 py-3 px-4">
            <div class="flex items-center gap-3">
                <a href="#"><img src="assets/blink.png" alt="Logo" class="h-12 rounded-full"></a>
                <a href="resident_homepage.php" class="font-bold text-lg">BarangayLink</a>
            </div>

            <!-- Mobile menu toggle (layout-only) -->
            <input id="navToggle" type="checkbox" class="hidden peer" />
            <label for="navToggle" class="md:hidden inline-flex items-center justify-center p-2 rounded-md hover:bg-blue-600/70 focus:outline-none focus:ring-2 focus:ring-white/40">
                <span class="sr-only">Toggle menu</span>
                <i class="fas fa-bars"></i>
            </label>

            <div class="hidden w-full md:block md:w-auto peer-checked:block">
                <div class="mt-2 md:mt-0 rounded-lg bg-blue-800/40 md:bg-transparent p-2 md:p-0 border border-white/10 md:border-0">
                    <ul class="flex flex-col md:flex-row md:items-center gap-1 md:gap-6">
                        <li>
                            <a href="#down2" class="hover:text-gray-200 hover:bg-blue-600/40 block px-3 py-2 rounded-md">Announcement</a>
                        </li>
                        <li>
                            <a href="#down1" class="hover:text-gray-200 hover:bg-blue-600/40 block px-3 py-2 rounded-md">E-Services</a>
                        </li>
                        <li class="relative">
                            <button class="w-full md:w-auto flex items-center justify-between md:justify-start gap-2 hover:text-gray-200 hover:bg-blue-600/40 px-3 py-2 rounded-md" id="accountDropdown">
                                <span>MY ACCOUNT</span><i class="fas fa-chevron-down"></i>
                            </button>
                            <div class="static md:absolute md:right-0 mt-2 w-full md:w-48 bg-white rounded-md shadow-lg hidden overflow-hidden" id="dropdownMenu">
                                <a href="resident_profile.php?id_resident=<?= $userdetails['id_resident']; ?>" class="block px-4 py-2 text-gray-800 hover:bg-gray-100"><i class="fas fa-user"></i> Personal Profile</a>
                                <a href="resident_changepass.php?id_resident=<?= $userdetails['id_resident']; ?>" class="block px-4 py-2 text-gray-800 hover:bg-gray-100"><i class="fas fa-lock"></i> Change Password</a>
                                <a href="logout.php" class="block px-4 py-2 text-gray-800 hover:bg-gray-100"><i class="fas fa-sign-out-alt"></i> Logout</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <script>
        document.getElementById('accountDropdown').addEventListener('click', function() {
            document.getElementById('dropdownMenu').classList.toggle('hidden');
        });
    </script>

    <!-- Welcome Header -->
    <div class="text-center mt-12">
        <h2 class="text-4xl md:text-5xl font-bold">Welcome to <br>East Modern Site Barangay Information Site</h2>
    </div>

    <style>
        .slide-active {
            /* Tailwind blue-500 */
            transform: scale(1.03);
            transition: all 0.2s ease;
        }
    </style>

    <!-- ANNOUNCEMENTS & ACTIVITIES CAROUSEL -->
    <div style="margin-top: 0;" id="down2" class="container mx-auto py-10 mt-16">
        <h2 class="text-3xl font-bold mb-6 text-center">Announcements & Activities</h2>

        <div class="swiper mySwiper">
            <div class="swiper-wrapper">

                <?php
                // ANNOUNCEMENTS
                $announcements = $bmis->view_announcement();
                if (!empty($announcements) && is_array($announcements)) {
                    foreach ($announcements as $announcement) {
                        $id = "announcement-" . $announcement['id_announcement'];
                ?>
                        <div class="swiper-slide cursor-pointer carousel-item"
                            onclick="openModal(
                                `<?= htmlspecialchars($announcement['title']); ?>`,
                                `<?= !empty($announcement['photo']) ? $announcement['photo'] : '' ?>`,
                                `<?= htmlspecialchars($announcement['event']); ?>`
                            )">
                            <div class="bg-white shadow-md rounded-lg p-6 flex flex-col h-full slide-content">
                                <h3 class="font-bold text-lg mb-2"><?= htmlspecialchars($announcement['title']); ?></h3>

                                <?php if (!empty($announcement['photo']) && file_exists($announcement['photo'])): ?>
                                    <img src="<?= $announcement['photo']; ?>" class="announcement-img mb-2 rounded w-full object-cover max-h-48">
                                <?php endif; ?>

                                <p class="text-gray-700 mb-4 truncate-lines"><?= htmlspecialchars($announcement['event']); ?></p>

                                <button onclick="toggleExpand('<?= $id ?>')" class="text-blue-600 hover:underline self-start mb-2">Read More</button>

                                <div id="<?= $id ?>" class="expandable-content hidden mt-2 max-h-64 border-t pt-2">
                                    <p class="text-gray-800"><?= nl2br(htmlspecialchars($announcement['event'])); ?></p>
                                    <button onclick="toggleExpand('<?= $id ?>')" class="mt-2 px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">
                                        Close
                                    </button>
                                </div>
                            </div>
                        </div>
                    <?php
                    }
                }

                // ACTIVITIES
                $rs = mysqli_query($db_connection, "SELECT id_activity, name, date, image FROM tbl_activities");
                if ($rs && mysqli_num_rows($rs) > 0) {
                    while ($rw = mysqli_fetch_assoc($rs)) {
                        $id = "activity-" . $rw['id_activity'];
                    ?>
                        <div class="swiper-slide cursor-pointer carousel-item"
                            onclick="openModal(
                        `<?= htmlspecialchars($rw['name']); ?>`,
                        `<?= !empty($rw['image']) ? $rw['image'] : '' ?>`,
                        `Date: <?= htmlspecialchars($rw['date']); ?>`
                    )">
                            <div class="bg-white shadow-md rounded-lg p-6 flex flex-col h-full slide-content">
                                <h3 class="font-bold text-lg mb-2"><?= htmlspecialchars($rw['name']); ?></h3>

                                <?php if (!empty($rw['image']) && file_exists($rw['image'])): ?>
                                    <img src="<?= $rw['image']; ?>" class="announcement-img mb-2 rounded w-full object-cover max-h-48">
                                <?php endif; ?>

                                <p class="text-gray-700 mb-4">Date: <?= htmlspecialchars($rw['date']); ?></p>

                                <button onclick="toggleExpand('<?= $id ?>')" class="text-blue-600 hover:underline self-start mb-2">Read More</button>

                                <div id="<?= $id ?>" class="expandable-content hidden mt-2 max-h-64 border-t pt-2">
                                    <p class="text-gray-800">Date: <?= htmlspecialchars($rw['date']); ?></p>
                                    <button onclick="toggleExpand('<?= $id ?>')" class="mt-2 px-3 py-1 bg-red-500 text-white rounded hover:bg-red-600">
                                        Close
                                    </button>
                                </div>
                            </div>
                        </div>
                <?php
                    }
                }
                ?>

            </div>

            <div class="swiper-pagination mt-4"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>
    <!-- MODAL -->
    <div id="carouselModal" class="fixed inset-0 bg-black/60 hidden items-center justify-center z-50">

        <div class="bg-white rounded-2xl shadow-xl w-full max-w-3xl p-6 relative animate-scaleIn max-h-[90vh] overflow-y-auto">

            <!-- Close -->
            <button onclick="closeModal()" class="absolute top-3 right-3 text-gray-500 hover:text-black text-2xl">
                &times;
            </button>

            <!-- Content -->
            <h3 id="modalTitle" class="text-2xl font-semibold mb-3"></h3>

            <img id="modalImage" class="w-full mb-4 rounded-lg hidden object-contain max-h-[80vh]">

            <p id="modalContent" class="text-gray-700 whitespace-pre-line"></p>

        </div>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {

            const slides = document.querySelectorAll(".carousel-item");

            slides.forEach(slide => {
                slide.addEventListener("click", function() {

                    // remove highlight from all
                    slides.forEach(s => s.classList.remove("slide-active"));

                    // add highlight to clicked one
                    this.classList.add("slide-active");

                });
            });

        });




        document.addEventListener("DOMContentLoaded", function() {
            /* =========================
     SLIDE HIGHLIGHT
  ========================= */
            const slides = document.querySelectorAll(".carousel-item");

            slides.forEach(slide => {
                slide.addEventListener("click", function() {

                    // remove highlight from all slides
                    slides.forEach(s => s.classList.remove("slide-active"));

                    // add highlight to clicked slide
                    this.classList.add("slide-active");

                });
            });

        });

        function openModal(title, image, content) {
            document.getElementById("modalTitle").textContent = title;
            document.getElementById("modalContent").textContent = content;

            const img = document.getElementById("modalImage");

            if (image) {
                img.src = image;
                img.classList.remove("hidden");
            } else {
                img.classList.add("hidden");
            }

            const modal = document.getElementById("carouselModal");
            modal.classList.remove("hidden");
            modal.classList.add("flex");

            // Prevent swiper dragging when modal open
            document.body.classList.add("overflow-hidden");
        }

        function closeModal() {
            const modal = document.getElementById("carouselModal");
            modal.classList.add("hidden");
            modal.classList.remove("flex");

            document.body.classList.remove("overflow-hidden");
        }

        // Close when clicking outside
        document.getElementById("carouselModal").addEventListener("click", function(e) {
            if (e.target === this) closeModal();
        });
    </script>
    <style>
        @keyframes scaleIn {
            from {
                transform: scale(0.9);
                opacity: 0;
            }

            to {
                transform: scale(1);
                opacity: 1;
            }
        }

        .animate-scaleIn {
            animation: scaleIn 0.2s ease;
        }
    </style>
    <script>
        // Set equal heights for slides
        function setEqualSlideHeights() {
            const slides = document.querySelectorAll('.slide-content');
            let maxHeight = 0;
            slides.forEach(slide => slide.style.height = 'auto');
            slides.forEach(slide => {
                if (slide.offsetHeight > maxHeight) maxHeight = slide.offsetHeight;
            });
            slides.forEach(slide => slide.style.height = maxHeight + 'px');
        }

        // Swiper Initialization
        const swiper = new Swiper(".mySwiper", {
            slidesPerView: 1,
            spaceBetween: 20,
            loop: true,
            pagination: {
                el: ".swiper-pagination",
                clickable: true
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev"
            },
            breakpoints: {
                640: {
                    slidesPerView: 1
                },
                768: {
                    slidesPerView: 2
                },
                1024: {
                    slidesPerView: 3
                }
            },
            on: {
                init: function() {
                    setEqualSlideHeights();
                },
                resize: function() {
                    setEqualSlideHeights();
                }
            }
        });

        // Expand/Collapse content
        function toggleExpand(id) {
            const el = document.getElementById(id);
            if (el.classList.contains('hidden')) {
                el.classList.remove('hidden');
                el.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            } else {
                el.classList.add('hidden');
            }
        }
    </script>

    <!-- E-Services Section -->
    <!-- <div id="down1" class="container mx-auto py-10">
        <div class="text-center mb-8">
            <h3 class="text-xl md:text-2xl mb-2">You may select the following services offered below:</h3>
            <h2 class="text-3xl md:text-4xl font-bold">E-Services</h2>
            <hr class="my-4 border-gray-300 w-24 mx-auto">
        </div>

        <div class="grid grid-cols-1 md:grid-cols-3 lg:grid-cols-5 gap-6">
            <a href="services_business.php?id_resident=<?= $userdetails['id_resident']; ?>" class="card-hover">
                <div class="bg-white rounded-lg shadow p-6 text-center">
                    <img src="icons/ResidentHomepage/busper.png" class="mx-auto mb-4">
                    <h4 class="font-semibold text-lg">Business Permit</h4>
                </div>
            </a>
            <a href="services_certofindigency.php?id_resident=<?= $userdetails['id_resident']; ?>" class="card-hover">
                <div class="bg-white rounded-lg shadow p-6 text-center">
                    <img src="icons/ResidentHomepage/indigency.png" class="mx-auto mb-4">
                    <h4 class="font-semibold text-lg">Certificate of Indigency</h4>
                </div>
            </a>
            <a href="services_certofres.php?id_resident=<?= $userdetails['id_resident']; ?>" class="card-hover">
                <div class="bg-white rounded-lg shadow p-6 text-center">
                    <img src="icons/ResidentHomepage/residency.png" class="mx-auto mb-4">
                    <h4 class="font-semibold text-lg">Certificate of Residency</h4>
                </div>
            </a>
            <a href="services_brgyclearance.php?id_resident=<?= $userdetails['id_resident']; ?>" class="card-hover">
                <div class="bg-white rounded-lg shadow p-6 text-center">
                    <img src="icons/ResidentHomepage/clearance.png" class="mx-auto mb-4">
                    <h4 class="font-semibold text-lg">Barangay Clearance</h4>
                </div>
            </a>
            <a href="services_blotter.php?id_resident=<?= $userdetails['id_resident']; ?>" class="card-hover">
                <div class="bg-white rounded-lg shadow p-6 text-center">
                    <img src="icons/ResidentHomepage/complain.png" class="mx-auto mb-4">
                    <h4 class="font-semibold text-lg">Peace and Order</h4>
                </div>
            </a>
        </div>
    </div> -->
    <!-- E-Services Accordion (Vertical Layout) -->


    <span id="down1"></span>

    <div class="container mx-auto py-10">

        <!-- Accordion Header -->
        <button onclick="toggleAccordion()"
            class="w-full flex justify-between items-center bg-gray-100 p-4 rounded-lg shadow hover:bg-gray-200 transition">

            <div class="text-left">
                <h2 class="text-2xl md:text-3xl font-bold">E-Services</h2>
                <p class="text-sm text-gray-600">Click to view available services</p>
            </div>

            <span id="arrow" class="text-xl transition-transform duration-300">▼</span>
        </button>

        <!-- Accordion Content -->
        <div id="accordionContent"
            class="overflow-hidden max-h-0 transition-all duration-500 ease-in-out">

            <!-- ✅ Vertical Stack -->
            <div class="mt-6 flex flex-col gap-4">

                <a href="services_business.php?id_resident=<?= $userdetails['id_resident']; ?>" class="card-hover">
                    <div class="bg-white rounded-lg shadow p-4 flex items-center gap-4">
                        <img src="icons/ResidentHomepage/busper.png" class="w-10 h-10">
                        <h4 class="font-semibold text-lg">Business Permit</h4>
                    </div>
                </a>

                <a href="services_certofindigency.php?id_resident=<?= $userdetails['id_resident']; ?>" class="card-hover">
                    <div class="bg-white rounded-lg shadow p-4 flex items-center gap-4">
                        <img src="icons/ResidentHomepage/indigency.png" class="w-10 h-10">
                        <h4 class="font-semibold text-lg">Certificate of Indigency</h4>
                    </div>
                </a>

                <a href="services_certofres.php?id_resident=<?= $userdetails['id_resident']; ?>" class="card-hover">
                    <div class="bg-white rounded-lg shadow p-4 flex items-center gap-4">
                        <img src="icons/ResidentHomepage/residency.png" class="w-10 h-10">
                        <h4 class="font-semibold text-lg">Certificate of Residency</h4>
                    </div>
                </a>

                <a href="services_brgyclearance.php?id_resident=<?= $userdetails['id_resident']; ?>" class="card-hover">
                    <div class="bg-white rounded-lg shadow p-4 flex items-center gap-4">
                        <img src="icons/ResidentHomepage/clearance.png" class="w-10 h-10">
                        <h4 class="font-semibold text-lg">Barangay Clearance</h4>
                    </div>
                </a>

                <a href="services_blotter.php?id_resident=<?= $userdetails['id_resident']; ?>" class="card-hover">
                    <div class="bg-white rounded-lg shadow p-4 flex items-center gap-4">
                        <img src="icons/ResidentHomepage/complain.png" class="w-10 h-10">
                        <h4 class="font-semibold text-lg">Peace and Order</h4>
                    </div>
                </a>

            </div>
        </div>
    </div>

  <script>
    // Accordion toggle function
    function toggleAccordion() {
        const content = document.getElementById("accordionContent");
        const arrow = document.getElementById("arrow");

        if (content.style.maxHeight && content.style.maxHeight !== "0px") {
            content.style.maxHeight = "0px";
            arrow.style.transform = "rotate(0deg)";
        } else {
            content.style.maxHeight = content.scrollHeight + "px";
            arrow.style.transform = "rotate(180deg)";
        }
    }

    // Expand accordion when clicking navbar link
    document.querySelector('a[href="#down1"]').addEventListener("click", function(e) {
        e.preventDefault(); // prevent instant jump
        const content = document.getElementById("accordionContent");
        const arrow = document.getElementById("arrow");

        // Open accordion if closed
        if (!content.style.maxHeight || content.style.maxHeight === "0px") {
            content.style.maxHeight = content.scrollHeight + "px";
            arrow.style.transform = "rotate(180deg)";
        }

        // Smooth scroll to the accordion
        document.getElementById("down1").scrollIntoView({ behavior: "smooth", block: "start" });
    });
     // Announcement link: scroll to top
    document.querySelector('a[href="#down2"]').addEventListener("click", function(e) {
        e.preventDefault();
        window.scrollTo({ top: 0, behavior: "smooth" });
    });
</script>

    <!-- Footer -->
    <footer class="bg-blue-700 text-white text-center py-6 mt-10">
        <hr class="border-gray-300 mb-2">
        <div class="py-3">
            Copyright 2025 - <script>
                document.write(new Date().getFullYear())
            </script> | BarangayLink
        </div>
    </footer>

</body>

</html>