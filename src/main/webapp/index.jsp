<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>DevOps Hospital — Modern Healthcare</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">

    <style>
        /* Quick fix - make sure body has content */
        .section {
            padding: 56px 0;
        }
        .container {
            width: 100%;
            max-width: 1240px;
            margin: 0 auto;
            padding: 0 24px;
        }
        .section-header {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            gap: 16px;
            margin-bottom: 32px;
            flex-wrap: wrap;
        }
        .section-header .title-group h2 {
            font-size: 28px;
            font-weight: 700;
        }
        .section-header .title-group p {
            color: #6b6b7a;
            margin-top: 4px;
            font-size: 15px;
        }
        .section-header .view-all {
            font-weight: 600;
            color: #2a7f9e;
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 14px;
            transition: 0.25s;
            white-space: nowrap;
        }
        .section-header .view-all:hover {
            gap: 12px;
        }
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 16px;
        }
        .products-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }
        .cat-card {
            background: #fff;
            border-radius: 16px;
            padding: 24px 16px;
            text-align: center;
            box-shadow: 0 4px 24px rgba(26, 26, 46, 0.06);
            transition: 0.25s;
            cursor: pointer;
            border: 2px solid transparent;
        }
        .cat-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 48px rgba(26, 26, 46, 0.10);
            border-color: #c8e2ed;
        }
        .cat-card .icon-wrap {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: #c8e2ed;
            display: grid;
            place-items: center;
            margin: 0 auto 12px;
            font-size: 24px;
            color: #2a7f9e;
            transition: 0.25s;
        }
        .cat-card:hover .icon-wrap {
            background: #2a7f9e;
            color: #fff;
        }
        .cat-card h4 {
            font-size: 15px;
            font-weight: 600;
        }
        .cat-card .count {
            font-size: 13px;
            color: #6b6b7a;
            margin-top: 4px;
        }
        .product-card {
            background: #fff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 24px rgba(26, 26, 46, 0.06);
            transition: 0.25s;
            display: flex;
            flex-direction: column;
            border: 2px solid transparent;
        }
        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 48px rgba(26, 26, 46, 0.10);
            border-color: #c8e2ed;
        }
        .product-card .img-wrap {
            position: relative;
            overflow: hidden;
            background: #f0efed;
            aspect-ratio: 1 / 1;
        }
        .product-card .img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: 0.25s;
        }
        .product-card:hover .img-wrap img {
            transform: scale(1.04);
        }
        .product-card .badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: #2a7f9e;
            color: #fff;
            padding: 4px 12px;
            border-radius: 999px;
            font-size: 11px;
            font-weight: 700;
        }
        .product-card .badge.sale {
            background: #e9c46a;
            color: #0b2b4a;
        }
        .product-card .wish-btn {
            position: absolute;
            top: 12px;
            right: 12px;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: rgba(255,255,255,0.90);
            display: grid;
            place-items: center;
            font-size: 16px;
            color: #6b6b7a;
            transition: 0.25s;
            border: none;
        }
        .product-card .wish-btn:hover {
            background: #fff;
            color: #2a7f9e;
            transform: scale(1.10);
        }
        .product-card .body {
            padding: 16px 18px 14px;
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }
        .product-card .body .category-tag {
            font-size: 12px;
            color: #a0a0b0;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-weight: 600;
        }
        .product-card .body h5 {
            font-size: 15px;
            font-weight: 600;
            line-height: 1.3;
        }
        .product-card .body .price-row {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 4px;
        }
        .product-card .body .price {
            font-weight: 700;
            font-size: 18px;
            color: #0b2b4a;
        }
        .product-card .body .old-price {
            color: #a0a0b0;
            text-decoration: line-through;
            font-size: 14px;
        }
        .product-card .body .rating {
            display: flex;
            align-items: center;
            gap: 4px;
            font-size: 13px;
            color: #f5a623;
        }
        .product-card .body .rating span {
            color: #6b6b7a;
            font-weight: 400;
        }
        .product-card .footer {
            padding: 0 18px 18px;
            display: flex;
            gap: 10px;
        }
        .product-card .footer .add-btn {
            flex: 1;
            padding: 10px;
            border-radius: 10px;
            background: #0b2b4a;
            color: #fff;
            font-weight: 600;
            font-size: 14px;
            transition: 0.25s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            border: none;
        }
        .product-card .footer .add-btn:hover {
            background: #2a7f9e;
            transform: scale(1.02);
        }
        .product-card .footer .add-btn.added {
            background: #2a9d8f;
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .products-grid { grid-template-columns: repeat(3, 1fr); }
            .categories-grid { grid-template-columns: repeat(3, 1fr); }
        }
        @media (max-width: 768px) {
            .products-grid { grid-template-columns: repeat(2, 1fr); }
            .categories-grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 480px) {
            .products-grid { grid-template-columns: 1fr 1fr; }
            .categories-grid { grid-template-columns: 1fr 1fr; }
        }
    </style>
</head>
<body>

    <!-- ===== HEADER ===== -->
    <header>
        <div class="container" style="display:flex;align-items:center;justify-content:space-between;gap:16px;padding:12px 24px;min-height:68px;">
            <div style="display:flex;align-items:center;gap:12px;">
                <button class="mobile-toggle" id="mobileToggle" aria-label="Toggle menu" style="display:none;width:42px;height:42px;border-radius:50%;font-size:20px;background:#e9eef3;border:none;cursor:pointer;">
                    <i class="fas fa-bars"></i>
                </button>
                <a class="brand" href="#" style="display:flex;align-items:center;gap:10px;font-weight:800;font-size:22px;color:#0b2b4a;">
                    <i class="fas fa-heartbeat" style="color:#2a7f9e;"></i>
                    <span>DevOps<span style="color:#2a7f9e;">Hospital</span></span>
                </a>
            </div>

            <nav class="main-nav" id="mainNav" aria-label="Main navigation">
                <ul style="display:flex;gap:4px;list-style:none;align-items:center;">
                    <li><a href="#" class="active" style="display:flex;align-items:center;gap:6px;padding:8px 16px;border-radius:10px;font-weight:500;font-size:14px;color:#4e5f6b;transition:0.25s;text-decoration:none;"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#categories" style="display:flex;align-items:center;gap:6px;padding:8px 16px;border-radius:10px;font-weight:500;font-size:14px;color:#4e5f6b;transition:0.25s;text-decoration:none;"><i class="fas fa-stethoscope"></i> Departments</a></li>
                    <li><a href="#products" style="display:flex;align-items:center;gap:6px;padding:8px 16px;border-radius:10px;font-weight:500;font-size:14px;color:#4e5f6b;transition:0.25s;text-decoration:none;"><i class="fas fa-user-md"></i> Doctors</a></li>
                    <li><a href="#deals" style="display:flex;align-items:center;gap:6px;padding:8px 16px;border-radius:10px;font-weight:500;font-size:14px;color:#4e5f6b;transition:0.25s;text-decoration:none;"><i class="fas fa-ambulance"></i> Offers</a></li>
                    <li><a href="#testimonials" style="display:flex;align-items:center;gap:6px;padding:8px 16px;border-radius:10px;font-weight:500;font-size:14px;color:#4e5f6b;transition:0.25s;text-decoration:none;"><i class="fas fa-star"></i> Reviews</a></li>
                </ul>
            </nav>

            <div style="display:flex;align-items:center;gap:10px;">
                <div class="search-wrap" role="search" style="display:flex;align-items:center;background:#e9eef3;border-radius:999px;padding:0 16px 0 18px;transition:0.25s;border:2px solid transparent;min-width:220px;">
                    <input type="search" id="searchInput" placeholder="Find a doctor..." aria-label="Search" style="border:0;background:transparent;outline:none;width:100%;padding:10px 0;font-size:14px;color:#0b2b4a;" />
                    <button id="searchBtn" aria-label="Submit search" style="padding:8px 0 8px 10px;color:#4e5f6b;font-size:15px;transition:0.25s;border:none;background:none;cursor:pointer;"><i class="fas fa-search"></i></button>
                </div>

                <div style="display:flex;align-items:center;gap:6px;">
                    <button class="icon-btn" title="Account" aria-label="Account" style="width:42px;height:42px;display:grid;place-items:center;border-radius:50%;font-size:18px;color:#4e5f6b;transition:0.25s;border:none;background:none;cursor:pointer;"><i class="far fa-user"></i></button>
                    <button class="icon-btn" title="Wishlist" aria-label="Wishlist" style="width:42px;height:42px;display:grid;place-items:center;border-radius:50%;font-size:18px;color:#4e5f6b;transition:0.25s;border:none;background:none;cursor:pointer;"><i class="far fa-heart"></i></button>
                    <div class="cart-wrap" style="position:relative;">
                        <button class="icon-btn" id="cartBtn" title="Appointments" aria-label="Appointments" style="width:42px;height:42px;display:grid;place-items:center;border-radius:50%;font-size:18px;color:#4e5f6b;transition:0.25s;border:none;background:none;cursor:pointer;">
                            <i class="fas fa-calendar-check"></i>
                        </button>
                        <span class="cart-count" id="cartCount" style="position:absolute;top:-2px;right:-2px;background:#2a7f9e;color:#fff;font-size:11px;font-weight:700;width:20px;height:20px;border-radius:50%;display:grid;place-items:center;border:2px solid #fff;">0</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Mobile Menu -->
        <div id="mobileMenu" style="display:none;background:#fff;border-top:1px solid rgba(11,43,74,0.04);padding:12px 0 20px;">
            <div class="container">
                <ul style="list-style:none;display:flex;flex-direction:column;gap:4px;">
                    <li><a href="#" style="display:flex;align-items:center;gap:12px;padding:12px 16px;border-radius:10px;font-weight:500;color:#0b2b4a;transition:0.25s;text-decoration:none;"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#categories" style="display:flex;align-items:center;gap:12px;padding:12px 16px;border-radius:10px;font-weight:500;color:#0b2b4a;transition:0.25s;text-decoration:none;"><i class="fas fa-stethoscope"></i> Departments</a></li>
                    <li><a href="#products" style="display:flex;align-items:center;gap:12px;padding:12px 16px;border-radius:10px;font-weight:500;color:#0b2b4a;transition:0.25s;text-decoration:none;"><i class="fas fa-user-md"></i> Doctors</a></li>
                    <li><a href="#deals" style="display:flex;align-items:center;gap:12px;padding:12px 16px;border-radius:10px;font-weight:500;color:#0b2b4a;transition:0.25s;text-decoration:none;"><i class="fas fa-ambulance"></i> Offers</a></li>
                    <li><a href="#testimonials" style="display:flex;align-items:center;gap:12px;padding:12px 16px;border-radius:10px;font-weight:500;color:#0b2b4a;transition:0.25s;text-decoration:none;"><i class="fas fa-star"></i> Reviews</a></li>
                </ul>
            </div>
        </div>
    </header>

    <!-- ===== MAIN CONTENT ===== -->
    <main>

        <!-- HERO -->
        <section class="hero" aria-label="Hero banner" style="position:relative;display:flex;align-items:center;min-height:480px;padding:60px 0;border-radius:16px;overflow:hidden;margin:20px 24px 0;background:linear-gradient(135deg,#0b2b4a 0%,#1a3f5f 100%);">
            <div style="position:absolute;inset:0;background:url('https://images.unsplash.com/photo-1584982751601-97dcc096659c?auto=format&fit=crop&w=1400&q=80') center/cover no-repeat;opacity:0.25;z-index:0;"></div>
            <div class="container" style="position:relative;z-index:1;">
                <div style="display:inline-block;background:rgba(42,127,158,0.20);color:#a6d9f0;padding:4px 16px;border-radius:999px;font-weight:600;font-size:13px;letter-spacing:0.3px;margin-bottom:16px;"><i class="fas fa-sparkles"></i> Compassionate Care</div>
                <h1 style="font-family:'Playfair Display',serif;font-size:48px;font-weight:700;color:#fff;line-height:1.15;max-width:640px;margin-bottom:16px;">Your Health, <br>Our Priority</h1>
                <p style="color:rgba(255,255,255,0.85);font-size:17px;max-width:520px;margin-bottom:28px;line-height:1.6;">Expert doctors, modern facilities, and compassionate care — all in one place. Book your appointment today.</p>
                <div class="actions" style="display:flex;gap:12px;flex-wrap:wrap;">
                    <button class="btn btn-primary" id="shopNow" style="display:inline-flex;align-items:center;justify-content:center;gap:8px;padding:12px 28px;border-radius:999px;font-weight:600;font-size:15px;transition:0.25s;border:2px solid #2a7f9e;background:#2a7f9e;color:#fff;cursor:pointer;"><i class="fas fa-calendar-plus"></i> Book Now</button>
                    <button class="btn btn-ghost" id="exploreDeals" style="display:inline-flex;align-items:center;justify-content:center;gap:8px;padding:12px 28px;border-radius:999px;font-weight:600;font-size:15px;transition:0.25s;border:2px solid rgba(255,255,255,0.25);background:rgba(255,255,255,0.15);color:#fff;cursor:pointer;"><i class="fas fa-clock"></i> Explore Offers</button>
                </div>
            </div>
        </section>

        <!-- CATEGORIES / DEPARTMENTS -->
        <section class="section" id="categories" aria-labelledby="cat-title" style="padding:56px 0;">
            <div class="container">
                <div class="section-header">
                    <div class="title-group">
                        <h2 id="cat-title">Our Departments</h2>
                        <p>Find specialized care from our expert teams</p>
                    </div>
                    <a href="#" class="view-all">All Departments <i class="fas fa-arrow-right"></i></a>
                </div>
                <div class="categories-grid" id="categoriesGrid" aria-live="polite"></div>
            </div>
        </section>

        <!-- DOCTORS / SERVICES -->
        <section class="section" id="products" aria-labelledby="prod-title" style="padding:56px 0;">
            <div class="container">
                <div class="section-header">
                    <div class="title-group">
                        <h2 id="prod-title">Our Doctors</h2>
                        <p>Meet our experienced medical specialists</p>
                    </div>
                    <a href="#" class="view-all">View All <i class="fas fa-arrow-right"></i></a>
                </div>
                <div class="products-grid" id="productsGrid" aria-live="polite"></div>
            </div>
        </section>

        <!-- DEAL / OFFER -->
        <section class="section" id="deals" aria-labelledby="deals-title" style="padding:56px 0;">
            <div class="container">
                <div class="section-header">
                    <div class="title-group">
                        <h2 id="deals-title">⚡ Health Package Offer</h2>
                        <p>Limited time — comprehensive health checkup at special price</p>
                    </div>
                </div>
                <div class="deal-wrap" style="display:flex;gap:0;background:#fff;border-radius:16px;overflow:hidden;box-shadow:0 4px 24px rgba(26,26,46,0.06);">
                    <div class="deal-img" style="flex:0 0 48%;background:#e9eef3;min-height:300px;">
                        <img src="https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?auto=format&fit=crop&w=800&q=80" alt="Health Checkup" loading="lazy" style="width:100%;height:100%;object-fit:cover;">
                    </div>
                    <div class="deal-content" style="flex:1;padding:40px 44px;display:flex;flex-direction:column;justify-content:center;">
                        <span class="tag" style="display:inline-block;background:#e9c46a;color:#0b2b4a;padding:4px 14px;border-radius:999px;font-size:12px;font-weight:700;text-transform:uppercase;letter-spacing:0.5px;align-self:flex-start;margin-bottom:12px;"><i class="fas fa-bolt"></i> Limited Offer</span>
                        <h3 style="font-size:28px;font-weight:700;margin-bottom:6px;color:#0b2b4a;">Complete Health Checkup</h3>
                        <p class="desc" style="color:#4e5f6b;margin-bottom:18px;">Full body checkup with specialist consultation, lab tests, and imaging.</p>
                        <div>
                            <span class="price-big" style="font-size:32px;font-weight:800;color:#0b2b4a;">$199 <span class="old" style="font-size:20px;font-weight:400;color:#8b9ba8;text-decoration:line-through;margin-left:10px;">$349</span></span>
                        </div>
                        <p class="stock" style="font-size:14px;color:#4e5f6b;margin:4px 0 16px;">Only <strong style="color:#2a7f9e;">12</strong> packages left — book now!</p>
                        <div class="timer-grid" id="dealTimer" style="display:flex;gap:12px;margin:16px 0 20px;">
                            <div class="timer-box" style="background:#0b2b4a;color:#fff;padding:10px 16px;border-radius:10px;min-width:68px;text-align:center;">
                                <div class="num" id="dealDays" style="font-size:26px;font-weight:700;line-height:1.2;">0</div>
                                <div class="label" style="font-size:11px;opacity:0.70;text-transform:uppercase;letter-spacing:0.5px;">Days</div>
                            </div>
                            <div class="timer-box" style="background:#0b2b4a;color:#fff;padding:10px 16px;border-radius:10px;min-width:68px;text-align:center;">
                                <div class="num" id="dealHours" style="font-size:26px;font-weight:700;line-height:1.2;">00</div>
                                <div class="label" style="font-size:11px;opacity:0.70;text-transform:uppercase;letter-spacing:0.5px;">Hours</div>
                            </div>
                            <div class="timer-box" style="background:#0b2b4a;color:#fff;padding:10px 16px;border-radius:10px;min-width:68px;text-align:center;">
                                <div class="num" id="dealMinutes" style="font-size:26px;font-weight:700;line-height:1.2;">00</div>
                                <div class="label" style="font-size:11px;opacity:0.70;text-transform:uppercase;letter-spacing:0.5px;">Mins</div>
                            </div>
                            <div class="timer-box" style="background:#0b2b4a;color:#fff;padding:10px 16px;border-radius:10px;min-width:68px;text-align:center;">
                                <div class="num" id="dealSeconds" style="font-size:26px;font-weight:700;line-height:1.2;">00</div>
                                <div class="label" style="font-size:11px;opacity:0.70;text-transform:uppercase;letter-spacing:0.5px;">Secs</div>
                            </div>
                        </div>
                        <button class="btn btn-primary" id="buyDeal" style="display:inline-flex;align-items:center;justify-content:center;gap:8px;padding:12px 28px;border-radius:999px;font-weight:600;font-size:15px;transition:0.25s;border:2px solid #2a7f9e;background:#2a7f9e;color:#fff;cursor:pointer;"><i class="fas fa-calendar-plus"></i> Book Package</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- TESTIMONIALS -->
        <section class="section" id="testimonials" aria-labelledby="test-title" style="padding:56px 0;">
            <div class="container">
                <div class="section-header">
                    <div class="title-group">
                        <h2 id="test-title">What Our Patients Say</h2>
                        <p>Real stories from real people</p>
                    </div>
                </div>
                <div class="testimonials-scroll" id="testimonialsList" style="display:flex;gap:20px;overflow-x:auto;padding:8px 4px 16px;scroll-snap-type:x mandatory;"></div>
            </div>
        </section>

        <!-- NEWSLETTER / HEALTH TIPS -->
        <section class="section" aria-labelledby="news-title" style="padding:56px 0;">
            <div class="container">
                <div class="newsletter-wrap" style="background:linear-gradient(135deg,#0b2b4a 0%,#1a3f5f 100%);border-radius:16px;padding:48px 56px;color:#fff;display:flex;align-items:center;justify-content:space-between;gap:32px;flex-wrap:wrap;">
                    <div class="text">
                        <h3 id="news-title" style="font-size:26px;font-weight:700;margin-bottom:4px;color:#fff;">Stay Healthy</h3>
                        <p style="opacity:0.75;font-size:15px;">Get health tips, offers & new services</p>
                    </div>
                    <form id="newsletterForm" onsubmit="return false;" style="display:flex;gap:10px;flex-wrap:wrap;flex:1;max-width:480px;">
                        <input type="email" id="newsletterEmail" placeholder="Enter your email" aria-label="Email" required style="flex:1;min-width:200px;padding:14px 20px;border-radius:999px;border:0;font-size:15px;background:rgba(255,255,255,0.12);color:#fff;transition:0.25s;outline:2px solid transparent;" />
                        <button class="btn" id="subscribeBtn" style="display:inline-flex;align-items:center;justify-content:center;gap:8px;padding:14px 32px;border-radius:999px;font-weight:600;font-size:15px;transition:0.25s;border:2px solid #2a7f9e;background:#2a7f9e;color:#fff;cursor:pointer;"><i class="fas fa-paper-plane"></i> Subscribe</button>
                        <div id="newsletterMsg" style="margin-top:12px;font-size:14px;opacity:0.9;width:100%;"></div>
                    </form>
                </div>
            </div>
        </section>

    </main>

    <!-- ===== FOOTER ===== -->
    <footer style="margin-top:16px;padding:44px 0 28px;border-top:1px solid rgba(11,43,74,0.04);background:#0b2b4a;color:rgba(255,255,255,0.8);">
        <div class="container">
            <div class="footer-grid" style="display:grid;grid-template-columns:2fr 1fr 1fr 1fr;gap:40px;margin-bottom:32px;">
                <div class="brand-col">
                    <div class="brand" style="display:flex;align-items:center;gap:10px;font-weight:800;font-size:20px;color:#fff;margin-bottom:8px;">
                        <i class="fas fa-heartbeat" style="color:#2a7f9e;"></i>
                        <span>DevOps<span style="color:#2a7f9e;">Hospital</span></span>
                    </div>
                    <p style="color:rgba(255,255,255,0.7);font-size:14px;max-width:300px;line-height:1.6;">Modern healthcare with compassion. Quality treatment, seamless experience.</p>
                    <div class="socials" style="display:flex;gap:10px;margin-top:14px;">
                        <a href="#" aria-label="Facebook" style="display:grid;place-items:center;width:40px;height:40px;border-radius:50%;background:rgba(255,255,255,0.08);color:rgba(255,255,255,0.6);transition:0.25s;font-size:16px;text-decoration:none;"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" aria-label="Twitter" style="display:grid;place-items:center;width:40px;height:40px;border-radius:50%;background:rgba(255,255,255,0.08);color:rgba(255,255,255,0.6);transition:0.25s;font-size:16px;text-decoration:none;"><i class="fab fa-twitter"></i></a>
                        <a href="#" aria-label="Instagram" style="display:grid;place-items:center;width:40px;height:40px;border-radius:50%;background:rgba(255,255,255,0.08);color:rgba(255,255,255,0.6);transition:0.25s;font-size:16px;text-decoration:none;"><i class="fab fa-instagram"></i></a>
                        <a href="#" aria-label="YouTube" style="display:grid;place-items:center;width:40px;height:40px;border-radius:50%;background:rgba(255,255,255,0.08);color:rgba(255,255,255,0.6);transition:0.25s;font-size:16px;text-decoration:none;"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>
                <div class="col">
                    <h5 style="font-weight:700;font-size:14px;margin-bottom:12px;color:#fff;">Hospital</h5>
                    <ul style="list-style:none;display:flex;flex-direction:column;gap:6px;">
                        <li><a href="#" style="color:rgba(255,255,255,0.6);font-size:14px;transition:0.25s;text-decoration:none;">About Us</a></li>
                        <li><a href="#" style="color:rgba(255,255,255,0.6);font-size:14px;transition:0.25s;text-decoration:none;">Careers</a></li>
                        <li><a href="#" style="color:rgba(255,255,255,0.6);font-size:14px;transition:0.25s;text-decoration:none;">Press</a></li>
                        <li><a href="#" style="color:rgba(255,255,255,0.6);font-size:14px;transition:0.25s;text-decoration:none;">Blog</a></li>
                    </ul>
                </div>
                <div class="col">
                    <h5 style="font-weight:700;font-size:14px;margin-bottom:12px;color:#fff;">Support</h5>
                    <ul style="list-style:none;display:flex;flex-direction:column;gap:6px;">
                        <li><a href="#" style="color:rgba(255,255,255,0.6);font-size:14px;transition:0.25s;text-decoration:none;">Help Center</a></li>
                        <li><a href="#" style="color:rgba(255,255,255,0.6);font-size:14px;transition:0.25s;text-decoration:none;">Appointments</a></li>
                        <li><a href="#" style="color:rgba(255,255,255,0.6);font-size:14px;transition:0.25s;text-decoration:none;">Emergency</a></li>
                        <li><a href="#" style="color
