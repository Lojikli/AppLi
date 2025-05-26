@echo off
setlocal enabledelayedexpansion
echo.
echo ====================================
echo    AppLi Repository Update Script
echo ====================================
echo.

REM Check if we're in a git repository
if not exist ".git" (
    echo Error: Not in a git repository!
    echo Please run this script from your project root directory.
    pause
    exit /b 1
)

REM Check if index.html exists
if not exist "index.html" (
    echo Error: index.html not found!
    echo Please ensure index.html is in the current directory.
    pause
    exit /b 1
)

echo Scanning for HTML files...
echo.

REM Create a list of HTML files
set "html_files="
for %%f in (*.html) do (
    if /i not "%%f"=="index.html" (
        echo Found: %%f
        set "html_files=!html_files! %%f"
    )
)

if "!html_files!"=="" (
    echo No HTML applications found to add.
    goto :skip_index_update
)

echo.
echo Updating index.html with discovered services...

REM Generate new professional landing page
call :generate_landing_page

echo Index.html has been updated with all services.
echo.

:skip_index_update

REM Display current status
echo Checking repository status...
git status

echo.
echo Adding all files to staging...
git add .

echo.
echo Current staged changes:
git status --short

echo.
set /p commit_msg="Enter commit message (or press Enter for default): "
if "%commit_msg%"=="" set commit_msg=Updated AppLi business services and landing page

echo.
echo Committing changes with message: "%commit_msg%"
git commit -m "%commit_msg%"

if %errorlevel% neq 0 (
    echo.
    echo No changes to commit or commit failed.
    echo.
    pause
    exit /b 1
)

echo.
echo Pushing to remote repository...
git push

if %errorlevel% neq 0 (
    echo.
    echo Push failed! Please check your internet connection and repository access.
    pause
    exit /b 1
)

echo.
echo ====================================
echo   Successfully updated repository!
echo ====================================
echo.
echo Your changes have been pushed to GitHub.
echo Repository URL: https://github.com/Lojikli/AppLi
echo GitHub Pages: https://lojikli.github.io/AppLi
echo.

REM Optional: Open GitHub Pages site
set /p open_github="Open your business website in browser? (y/n): "
if /i "%open_github%"=="y" start https://lojikli.github.io/AppLi

echo.
pause
goto :eof

REM Function to generate complete professional landing page
:generate_landing_page

echo Creating professional business landing page...

(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>AppLi - Business Solutions That Drive Results^</title^>
echo     ^<meta name="description" content="Professional business tools for invoicing, financial planning, SEO, social media management, and more. Streamline your operations today."^>
echo     ^<style^>
echo         * {
echo             margin: 0;
echo             padding: 0;
echo             box-sizing: border-box;
echo         }
echo.
echo         body {
echo             font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
echo             line-height: 1.6;
echo             color: #333;
echo             background: linear-gradient^(135deg, #1e3c72 0%%, #2a5298 100%%^);
echo             min-height: 100vh;
echo         }
echo.
echo         .container {
echo             max-width: 1200px;
echo             margin: 0 auto;
echo             padding: 0 20px;
echo         }
echo.
echo         header {
echo             background: rgba^(255, 255, 255, 0.95^);
echo             backdrop-filter: blur^(10px^);
echo             border-bottom: 1px solid rgba^(255, 255, 255, 0.2^);
echo             padding: 1rem 0;
echo             position: sticky;
echo             top: 0;
echo             z-index: 100;
echo             box-shadow: 0 2px 20px rgba^(0,0,0,0.1^);
echo         }
echo.
echo         .header-content {
echo             display: flex;
echo             justify-content: space-between;
echo             align-items: center;
echo         }
echo.
echo         .logo {
echo             font-size: 2.2rem;
echo             font-weight: bold;
echo             background: linear-gradient^(45deg, #1e3c72, #2a5298^);
echo             -webkit-background-clip: text;
echo             -webkit-text-fill-color: transparent;
echo             background-clip: text;
echo         }
echo.
echo         .nav {
echo             display: flex;
echo             gap: 2rem;
echo         }
echo.
echo         .nav a {
echo             color: #333;
echo             text-decoration: none;
echo             font-weight: 500;
echo             transition: color 0.3s ease;
echo             position: relative;
echo         }
echo.
echo         .nav a:hover {
echo             color: #1e3c72;
echo         }
echo.
echo         .nav a::after {
echo             content: '';
echo             position: absolute;
echo             width: 0;
echo             height: 2px;
echo             bottom: -5px;
echo             left: 0;
echo             background: #1e3c72;
echo             transition: width 0.3s ease;
echo         }
echo.
echo         .nav a:hover::after {
echo             width: 100%%;
echo         }
echo.
echo         .hero {
echo             text-align: center;
echo             padding: 5rem 0;
echo             color: white;
echo             background: linear-gradient^(135deg, rgba^(30,60,114,0.9^), rgba^(42,82,152,0.9^)^);
echo         }
echo.
echo         .hero h1 {
echo             font-size: 4rem;
echo             margin-bottom: 1.5rem;
echo             text-shadow: 2px 2px 4px rgba^(0,0,0,0.3^);
echo             animation: fadeInUp 1s ease-out;
echo         }
echo.
echo         .hero .subtitle {
echo             font-size: 1.4rem;
echo             margin-bottom: 1rem;
echo             opacity: 0.95;
echo             animation: fadeInUp 1s ease-out 0.2s both;
echo         }
echo.
echo         .hero .description {
echo             font-size: 1.1rem;
echo             margin-bottom: 3rem;
echo             opacity: 0.9;
echo             max-width: 600px;
echo             margin-left: auto;
echo             margin-right: auto;
echo             animation: fadeInUp 1s ease-out 0.3s both;
echo         }
echo.
echo         .cta-buttons {
echo             display: flex;
echo             gap: 1rem;
echo             justify-content: center;
echo             flex-wrap: wrap;
echo             animation: fadeInUp 1s ease-out 0.5s both;
echo         }
echo.
echo         .cta-primary {
echo             display: inline-block;
echo             padding: 18px 35px;
echo             background: linear-gradient^(45deg, #ff6b35, #f7931e^);
echo             color: white;
echo             text-decoration: none;
echo             border-radius: 50px;
echo             font-weight: bold;
echo             font-size: 1.1rem;
echo             transition: all 0.3s ease;
echo             box-shadow: 0 5px 15px rgba^(255,107,53,0.3^);
echo         }
echo.
echo         .cta-primary:hover {
echo             transform: translateY^(-3px^);
echo             box-shadow: 0 10px 25px rgba^(255,107,53,0.4^);
echo         }
echo.
echo         .cta-secondary {
echo             display: inline-block;
echo             padding: 18px 35px;
echo             background: transparent;
echo             color: white;
echo             text-decoration: none;
echo             border: 2px solid white;
echo             border-radius: 50px;
echo             font-weight: bold;
echo             font-size: 1.1rem;
echo             transition: all 0.3s ease;
echo         }
echo.
echo         .cta-secondary:hover {
echo             background: white;
echo             color: #1e3c72;
echo             transform: translateY^(-3px^);
echo         }
echo.
echo         .services-section {
echo             padding: 5rem 0;
echo             background: white;
echo         }
echo.
echo         .section-header {
echo             text-align: center;
echo             margin-bottom: 4rem;
echo         }
echo.
echo         .section-title {
echo             font-size: 2.8rem;
echo             margin-bottom: 1rem;
echo             color: #333;
echo             position: relative;
echo         }
echo.
echo         .section-subtitle {
echo             font-size: 1.2rem;
echo             color: #666;
echo             max-width: 600px;
echo             margin: 0 auto;
echo         }
echo.
echo         .section-title::after {
echo             content: '';
echo             display: block;
echo             width: 80px;
echo             height: 4px;
echo             background: linear-gradient^(45deg, #ff6b35, #f7931e^);
echo             margin: 1.5rem auto;
echo             border-radius: 2px;
echo         }
echo.
echo         .services-grid {
echo             display: grid;
echo             grid-template-columns: repeat^(auto-fit, minmax^(380px, 1fr^)^);
echo             gap: 2.5rem;
echo             margin-top: 3rem;
echo         }
echo.
echo         .service-card {
echo             background: white;
echo             padding: 2.5rem;
echo             border-radius: 20px;
echo             box-shadow: 0 15px 40px rgba^(0,0,0,0.08^);
echo             transition: all 0.3s ease;
echo             position: relative;
echo             overflow: hidden;
echo             border: 1px solid #f0f0f0;
echo         }
echo.
echo         .service-card::before {
echo             content: '';
echo             position: absolute;
echo             top: 0;
echo             left: 0;
echo             right: 0;
echo             height: 5px;
echo             background: linear-gradient^(45deg, #1e3c72, #2a5298^);
echo         }
echo.
echo         .service-card:hover {
echo             transform: translateY^(-10px^);
echo             box-shadow: 0 25px 50px rgba^(0,0,0,0.15^);
echo         }
echo.
echo         .service-icon {
echo             width: 70px;
echo             height: 70px;
echo             background: linear-gradient^(45deg, #1e3c72, #2a5298^);
echo             border-radius: 20px;
echo             display: flex;
echo             align-items: center;
echo             justify-content: center;
echo             margin-bottom: 1.5rem;
echo             font-size: 1.8rem;
echo             color: white;
echo             box-shadow: 0 5px 15px rgba^(30,60,114,0.3^);
echo         }
echo.
echo         .service-card h3 {
echo             font-size: 1.5rem;
echo             margin-bottom: 1rem;
echo             color: #333;
echo             font-weight: 600;
echo         }
echo.
echo         .service-card .benefits {
echo             color: #666;
echo             margin-bottom: 1.5rem;
echo             line-height: 1.7;
echo         }
echo.
echo         .service-features {
echo             list-style: none;
echo             margin-bottom: 2rem;
echo         }
echo.
echo         .service-features li {
echo             padding: 0.3rem 0;
echo             color: #555;
echo             position: relative;
echo             padding-left: 1.5rem;
echo         }
echo.
echo         .service-features li::before {
echo             content: '✓';
echo             position: absolute;
echo             left: 0;
echo             color: #28a745;
echo             font-weight: bold;
echo         }
echo.
echo         .service-link {
echo             display: inline-block;
echo             padding: 12px 28px;
echo             background: linear-gradient^(45deg, #1e3c72, #2a5298^);
echo             color: white;
echo             text-decoration: none;
echo             border-radius: 30px;
echo             font-weight: 600;
echo             transition: all 0.3s ease;
echo             width: 100%%;
echo             text-align: center;
echo             font-size: 1rem;
echo         }
echo.
echo         .service-link:hover {
echo             transform: translateY^(-2px^);
echo             box-shadow: 0 8px 20px rgba^(30,60,114,0.3^);
echo         }
echo.
echo         .value-section {
echo             padding: 5rem 0;
echo             background: linear-gradient^(135deg, #f8f9fa, #e9ecef^);
echo         }
echo.
echo         .value-grid {
echo             display: grid;
echo             grid-template-columns: repeat^(auto-fit, minmax^(280px, 1fr^)^);
echo             gap: 2.5rem;
echo             margin-top: 3rem;
echo         }
echo.
echo         .value-item {
echo             text-align: center;
echo             padding: 2rem;
echo             background: white;
echo             border-radius: 15px;
echo             box-shadow: 0 10px 30px rgba^(0,0,0,0.08^);
echo             transition: transform 0.3s ease;
echo         }
echo.
echo         .value-item:hover {
echo             transform: translateY^(-5px^);
echo         }
echo.
echo         .value-icon {
echo             font-size: 3rem;
echo             margin-bottom: 1.5rem;
echo             display: block;
echo         }
echo.
echo         .value-item h3 {
echo             font-size: 1.3rem;
echo             margin-bottom: 1rem;
echo             color: #333;
echo         }
echo.
echo         .value-item p {
echo             color: #666;
echo             line-height: 1.6;
echo         }
echo.
echo         .contact-section {
echo             padding: 4rem 0;
echo             background: linear-gradient^(135deg, #1e3c72, #2a5298^);
echo             color: white;
echo             text-align: center;
echo         }
echo.
echo         .contact-content {
echo             max-width: 600px;
echo             margin: 0 auto;
echo         }
echo.
echo         .contact-section h2 {
echo             font-size: 2.5rem;
echo             margin-bottom: 1rem;
echo         }
echo.
echo         .contact-section p {
echo             font-size: 1.2rem;
echo             margin-bottom: 2rem;
echo             opacity: 0.9;
echo         }
echo.
echo         .contact-info {
echo             display: flex;
echo             justify-content: center;
echo             gap: 3rem;
echo             flex-wrap: wrap;
echo             margin-top: 2rem;
echo         }
echo.
echo         .contact-item {
echo             text-align: center;
echo         }
echo.
echo         .contact-item .icon {
echo             font-size: 2rem;
echo             margin-bottom: 0.5rem;
echo             display: block;
echo         }
echo.
echo         footer {
echo             background: #1a1a1a;
echo             color: #ccc;
echo             text-align: center;
echo             padding: 2rem 0;
echo         }
echo.
echo         @keyframes fadeInUp {
echo             from {
echo                 opacity: 0;
echo                 transform: translateY^(30px^);
echo             }
echo             to {
echo                 opacity: 1;
echo                 transform: translateY^(0^);
echo             }
echo         }
echo.
echo         @media ^(max-width: 768px^) {
echo             .hero h1 {
echo                 font-size: 2.8rem;
echo             }
echo             
echo             .hero .subtitle {
echo                 font-size: 1.2rem;
echo             }
echo             
echo             .services-grid {
echo                 grid-template-columns: 1fr;
echo             }
echo             
echo             .nav {
echo                 display: none;
echo             }
echo.
echo             .cta-buttons {
echo                 flex-direction: column;
echo                 align-items: center;
echo             }
echo.
echo             .contact-info {
echo                 flex-direction: column;
echo                 gap: 1.5rem;
echo             }
echo         }
echo     ^</style^>
echo ^</head^>
echo ^<body^>
echo     ^<header^>
echo         ^<div class="container"^>
echo             ^<div class="header-content"^>
echo                 ^<div class="logo"^>AppLi^</div^>
echo                 ^<nav class="nav"^>
echo                     ^<a href="#services"^>Services^</a^>
echo                     ^<a href="#benefits"^>Benefits^</a^>
echo                     ^<a href="#contact"^>Contact^</a^>
echo                 ^</nav^>
echo             ^</div^>
echo         ^</div^>
echo     ^</header^>
echo.
echo     ^<section class="hero"^>
echo         ^<div class="container"^>
echo             ^<h1^>Business Solutions That Drive Results^</h1^>
echo             ^<p class="subtitle"^>Professional tools designed to streamline operations and boost productivity^</p^>
echo             ^<p class="description"^>From invoice generation to financial planning, SEO optimization to social media management - we provide the comprehensive business tools you need to succeed.^</p^>
echo             ^<div class="cta-buttons"^>
echo                 ^<a href="#services" class="cta-primary"^>Explore Our Services^</a^>
echo                 ^<a href="#contact" class="cta-secondary"^>Get Started Today^</a^>
echo             ^</div^>
echo         ^</div^>
echo     ^</section^>
echo.
echo     ^<section id="services" class="services-section"^>
echo         ^<div class="container"^>
echo             ^<div class="section-header"^>
echo                 ^<h2 class="section-title"^>Professional Business Services^</h2^>
echo                 ^<p class="section-subtitle"^>Choose from our comprehensive suite of business tools designed to save time and increase efficiency^</p^>
echo             ^</div^>
echo             ^<div class="services-grid"^>
) > temp_index.html

REM Add service cards for each HTML file
for %%f in (*.html) do (
    if /i not "%%f"=="index.html" (
        call :add_service_card "%%f"
    )
)

REM Add the rest of the HTML structure
(
echo             ^</div^>
echo         ^</div^>
echo     ^</section^>
echo.
echo     ^<section id="benefits" class="value-section"^>
echo         ^<div class="container"^>
echo             ^<div class="section-header"^>
echo                 ^<h2 class="section-title"^>Why Choose AppLi?^</h2^>
echo                 ^<p class="section-subtitle"^>Professional-grade solutions designed for modern businesses^</p^>
echo             ^</div^>
echo             ^<div class="value-grid"^>
echo                 ^<div class="value-item"^>
echo                     ^<span class="value-icon"^>⚡^</span^>
echo                     ^<h3^>Instant Results^</h3^>
echo                     ^<p^>Start using our tools immediately - no downloads, installations, or complex setup required.^</p^>
echo                 ^</div^>
echo                 ^<div class="value-item"^>
echo                     ^<span class="value-icon"^>💼^</span^>
echo                     ^<h3^>Professional Quality^</h3^>
echo                     ^<p^>Enterprise-grade tools designed by business professionals for business professionals.^</p^>
echo                 ^</div^>
echo                 ^<div class="value-item"^>
echo                     ^<span class="value-icon"^>💰^</span^>
echo                     ^<h3^>Cost Effective^</h3^>
echo                     ^<p^>Get powerful business tools without the high costs of enterprise software subscriptions.^</p^>
echo                 ^</div^>
echo                 ^<div class="value-item"^>
echo                     ^<span class="value-icon"^>🔒^</span^>
echo                     ^<h3^>Secure ^& Private^</h3^>
echo                     ^<p^>Your business data stays private and secure with client-side processing and no data storage.^</p^>
echo                 ^</div^>
echo                 ^<div class="value-item"^>
echo                     ^<span class="value-icon"^>📱^</span^>
echo                     ^<h3^>Works Everywhere^</h3^>
echo                     ^<p^>Access your tools from any device - desktop, tablet, or mobile - with responsive design.^</p^>
echo                 ^</div^>
echo                 ^<div class="value-item"^>
echo                     ^<span class="value-icon"^>🎯^</span^>
echo                     ^<h3^>Results Focused^</h3^>
echo                     ^<p^>Every tool is designed to deliver measurable improvements to your business operations.^</p^>
echo                 ^</div^>
echo             ^</div^>
echo         ^</div^>
echo     ^</section^>
echo.
echo     ^<section id="contact" class="contact-section"^>
echo         ^<div class="container"^>
echo             ^<div class="contact-content"^>
echo                 ^<h2^>Ready to Transform Your Business?^</h2^>
echo                 ^<p^>Join thousands of professionals who are already using AppLi to streamline their operations and drive growth.^</p^>
echo                 ^<div class="cta-buttons"^>
echo                     ^<a href="#services" class="cta-primary"^>Get Started Now^</a^>
echo                 ^</div^>
echo                 ^<div class="contact-info"^>
echo                     ^<div class="contact-item"^>
echo                         ^<span class="icon"^>📧^</span^>
echo                         ^<strong^>Email Support^</strong^>
echo                         ^<p^>support@appli.com^</p^>
echo                     ^</div^>
echo                     ^<div class="contact-item"^>
echo                         ^<span class="icon"^>🌐^</span^>
echo                         ^<strong^>Available 24/7^</strong^>
echo                         ^<p^>Access tools anytime^</p^>
echo                     ^</div^>
echo                     ^<div class="contact-item"^>
echo                         ^<span class="icon"^>⚡^</span^>
echo                         ^<strong^>Instant Access^</strong^>
echo                         ^<p^>No signup required^</p^>
echo                     ^</div^>
echo                 ^</div^>
echo             ^</div^>
echo         ^</div^>
echo     ^</section^>
echo.
echo     ^<footer^>
echo         ^<div class="container"^>
echo             ^<p^>^&copy; 2025 AppLi Business Solutions. All rights reserved.^</p^>
echo             ^<p^>Professional tools for modern businesses^</p^>
echo         ^</div^>
echo     ^</footer^>
echo.
echo     ^<script^>
echo         // Smooth scrolling for navigation links
echo         document.querySelectorAll^('a[href^="#"]'^).forEach^(anchor =^> {
echo             anchor.addEventListener^('click', function ^(e^) {
echo                 e.preventDefault^(^);
echo                 const target = document.querySelector^(this.getAttribute^('href'^)^);
echo                 if ^(target^) {
echo                     target.scrollIntoView^({
echo                         behavior: 'smooth',
echo                         block: 'start'
echo                     }^);
echo                 }
echo             }^);
echo         }^);
echo.
echo         // Add loading animation to service cards
echo         const observerOptions = {
echo             threshold: 0.1,
echo             rootMargin: '0px 0px -50px 0px'
echo         };
echo.
echo         const observer = new IntersectionObserver^(^(entries^) =^> {
echo             entries.forEach^(entry =^> {
echo                 if ^(entry.isIntersecting^) {
echo                     entry.target.style.animation = 'fadeInUp 0.6s ease-out forwards';
echo                 }
echo             }^);
echo         }, observerOptions^);
echo.
echo         document.querySelectorAll^('.service-card, .value-item'^).forEach^(card =^> {
echo             card.style.opacity = '0';
echo             observer.observe^(card^);
echo         }^);
echo.
echo         // Track service usage for analytics
echo         document.querySelectorAll^('.service-link'^).forEach^(link =^> {
echo             link.addEventListener^('click', function^(^) {
echo                 const serviceName = this.closest^('.service-card'^).querySelector^('h3'^).textContent;
echo                 console.log^(`Customer accessing: ${serviceName}`^);
echo             }^);
echo         }^);
echo     ^</script^>
echo ^</body^>
echo ^</html^>
) >> temp_index.html

REM Replace the original index.html
move temp_index.html index.html

goto :eof

REM Function to add individual service card
:add_service_card
set "filename=%~1"
set "basename=%~n1"
set "displayname=%basename:_= %"

REM Determine icon and description based on filename
set "icon=📱"
set "description=Professional business solution designed to streamline your workflow and improve productivity."
set "feature1=Streamlined interface"
set "feature2=Professional results"
set "feature3=Easy to use"
set "feature4=Instant access"

echo %basename% | findstr /i "invoice" >nul && (
    set "icon=📊"
    set "description=Create professional, branded invoices in minutes. Streamline your billing process and get paid faster."
    set "feature1=Professional invoice templates"
    set "feature2=Automatic calculations"
    set "feature3=Brand customization"
    set "feature4=Multiple export formats"
)

echo %basename% | findstr /i "finance" >nul && (
    set "icon=💰"
    set "description=Make informed financial decisions with our comprehensive calculation suite for loans, investments, and budgets."
    set "feature1=Loan payment calculators"
    set "feature2=Investment return analysis"
    set "feature3=Budget planning tools"
    set "feature4=Financial forecasting"
)

echo %basename% | findstr /i "price" >nul && (
    set "icon=📈"
    set "description=Stay competitive with real-time price tracking across multiple platforms and intelligent market analysis."
    set "feature1=Multi-platform price tracking"
    set "feature2=Automated price alerts"
    set "feature3=Market trend analysis"
    set "feature4=Competitor monitoring"
)

echo %basename% | findstr /i "seo" >nul && (
    set "icon=🔍"
    set "description=Improve your online visibility with professional SEO tools for keyword research, ranking analysis, and site audits."
    set "feature1=Keyword research & analysis"
    set "feature2=Ranking position tracking"
    set "feature3=SEO site auditing"
    set "feature4=Competitor analysis"
)

echo %basename% | findstr /i "social" >nul && (
    set "icon=📱"
    set "description=Manage your social media presence efficiently with content scheduling, analytics, and engagement tracking."
    set "feature1=Content scheduling"
    set "feature2=Multi-platform management"
    set "feature3=Engagement analytics"
    set "feature4=Performance reporting"
)

echo %basename% | findstr /i "travel" >nul && (
    set "icon=✈️"
    set "description=Optimize your business travel with comprehensive planning tools, expense tracking, and itinerary management."
    set "feature1=Trip planning & optimization"
    set "feature2=Expense tracking"
    set "feature3=Itinerary management"
    set "feature4=Travel cost analysis"
)

echo %basename% | findstr /i "crm\|customer\|client" >nul && (
    set "icon=👥"
    set "description=Manage customer relationships with advanced CRM tools for contact management and sales tracking."
    set "feature1=Contact management"
    set "feature2=Sales pipeline tracking"
    set "feature3=Communication history"
    set "feature4=Customer analytics"
)

echo %basename% | findstr /i "project\|task\|manage" >nul && (
    set "icon=📋"
    set "description=Organize projects and tasks with professional management tools for teams and individuals."
    set "feature1=Task organization"
    set "feature2=Project timelines"
    set "feature3=Team collaboration"
    set "feature4=Progress tracking"
)

echo %basename% | findstr /i "report\|analytics\|dashboard" >nul && (
    set "icon=📊"
    set "description=Generate comprehensive reports and analytics dashboards to gain insights into business performance."
    set "feature1=Custom report generation"
    set "feature2=Data visualization"
    set "feature3=Performance metrics"
    set "feature4=Export capabilities"
)

echo %basename% | findstr /i "inventory\|stock\|warehouse" >nul && (
    set "icon=📦"
    set "description=Track inventory levels and manage stock with professional warehouse management tools."
    set "feature1=Inventory tracking"
    set "feature2=Stock level alerts"
    set "feature3=Supplier management"
    set "feature4=Order processing"
)

(
echo                 ^<div class="service-card"^>
echo                     ^<div class="service-icon"^>!icon!^</div^>
echo                     ^<h3^>!displayname!^</h3^>
echo                     ^<p class="benefits"^>!description!^</p^>
echo                     ^<ul class="service-features"^>
echo                         ^<li^>!feature1!^</li^>
echo                         ^<li^>!feature2!^</li^>
echo                         ^<li^>!feature3!^</li^>
echo                         ^<li^>!feature4!^</li^>
echo                     ^</ul^>
echo                     ^<a href="!filename!" class="service-link"^>Access This Service^</a^>
echo                 ^</div^>
) >> temp_index.html

goto :eof