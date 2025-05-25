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
echo Updating index.html with discovered applications...

REM Generate new apps grid content
call :generate_apps_grid

echo Index.html has been updated with all applications.
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
if "%commit_msg%"=="" set commit_msg=Updated AppLi applications and index page

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

REM Optional: Open GitHub repository in browser
set /p open_github="Open GitHub Pages site in browser? (y/n): "
if /i "%open_github%"=="y" start https://lojikli.github.io/AppLi

echo.
pause
goto :eof

REM Function to generate apps grid
:generate_apps_grid

REM Create temporary file with new content
echo Creating updated apps grid...

(
echo ^<!DOCTYPE html^>
echo ^<html lang="en"^>
echo ^<head^>
echo     ^<meta charset="UTF-8"^>
echo     ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^>
echo     ^<title^>AppLi - Professional Business Solutions^</title^>
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
echo             background: linear-gradient^(135deg, #667eea 0%%, #764ba2 100%%^);
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
echo             background: rgba^(255, 255, 255, 0.1^);
echo             backdrop-filter: blur^(10px^);
echo             border-bottom: 1px solid rgba^(255, 255, 255, 0.2^);
echo             padding: 1rem 0;
echo             position: sticky;
echo             top: 0;
echo             z-index: 100;
echo         }
echo.
echo         .header-content {
echo             display: flex;
echo             justify-content: space-between;
echo             align-items: center;
echo         }
echo.
echo         .logo {
echo             font-size: 2rem;
echo             font-weight: bold;
echo             color: white;
echo             text-shadow: 2px 2px 4px rgba^(0,0,0,0.3^);
echo         }
echo.
echo         .nav {
echo             display: flex;
echo             gap: 2rem;
echo         }
echo.
echo         .nav a {
echo             color: white;
echo             text-decoration: none;
echo             font-weight: 500;
echo             transition: color 0.3s ease;
echo         }
echo.
echo         .nav a:hover {
echo             color: #ffd700;
echo         }
echo.
echo         .hero {
echo             text-align: center;
echo             padding: 4rem 0;
echo             color: white;
echo         }
echo.
echo         .hero h1 {
echo             font-size: 3.5rem;
echo             margin-bottom: 1rem;
echo             text-shadow: 2px 2px 4px rgba^(0,0,0,0.5^);
echo             animation: fadeInUp 1s ease-out;
echo         }
echo.
echo         .hero p {
echo             font-size: 1.3rem;
echo             margin-bottom: 2rem;
echo             opacity: 0.9;
echo             animation: fadeInUp 1s ease-out 0.2s both;
echo         }
echo.
echo         .cta-button {
echo             display: inline-block;
echo             padding: 15px 30px;
echo             background: linear-gradient^(45deg, #ffd700, #ffed4a^);
echo             color: #333;
echo             text-decoration: none;
echo             border-radius: 50px;
echo             font-weight: bold;
echo             font-size: 1.1rem;
echo             transition: transform 0.3s ease, box-shadow 0.3s ease;
echo             animation: fadeInUp 1s ease-out 0.4s both;
echo         }
echo.
echo         .cta-button:hover {
echo             transform: translateY^(-3px^);
echo             box-shadow: 0 10px 25px rgba^(0,0,0,0.2^);
echo         }
echo.
echo         .apps-section {
echo             padding: 4rem 0;
echo             background: rgba^(255, 255, 255, 0.95^);
echo             margin: 2rem 0;
echo             border-radius: 20px;
echo             backdrop-filter: blur^(10px^);
echo         }
echo.
echo         .section-title {
echo             text-align: center;
echo             font-size: 2.5rem;
echo             margin-bottom: 3rem;
echo             color: #333;
echo             position: relative;
echo         }
echo.
echo         .section-title::after {
echo             content: '';
echo             display: block;
echo             width: 80px;
echo             height: 4px;
echo             background: linear-gradient^(45deg, #667eea, #764ba2^);
echo             margin: 1rem auto;
echo             border-radius: 2px;
echo         }
echo.
echo         .apps-grid {
echo             display: grid;
echo             grid-template-columns: repeat^(auto-fit, minmax^(350px, 1fr^)^);
echo             gap: 2rem;
echo             margin-top: 2rem;
echo         }
echo.
echo         .app-card {
echo             background: white;
echo             padding: 2rem;
echo             border-radius: 15px;
echo             box-shadow: 0 10px 30px rgba^(0,0,0,0.1^);
echo             transition: transform 0.3s ease, box-shadow 0.3s ease;
echo             position: relative;
echo             overflow: hidden;
echo         }
echo.
echo         .app-card::before {
echo             content: '';
echo             position: absolute;
echo             top: 0;
echo             left: 0;
echo             right: 0;
echo             height: 4px;
echo             background: linear-gradient^(45deg, #667eea, #764ba2^);
echo         }
echo.
echo         .app-card:hover {
echo             transform: translateY^(-10px^);
echo             box-shadow: 0 20px 40px rgba^(0,0,0,0.15^);
echo         }
echo.
echo         .app-icon {
echo             width: 60px;
echo             height: 60px;
echo             background: linear-gradient^(45deg, #667eea, #764ba2^);
echo             border-radius: 15px;
echo             display: flex;
echo             align-items: center;
echo             justify-content: center;
echo             margin-bottom: 1rem;
echo             font-size: 1.5rem;
echo             color: white;
echo         }
echo.
echo         .app-card h3 {
echo             font-size: 1.4rem;
echo             margin-bottom: 1rem;
echo             color: #333;
echo         }
echo.
echo         .app-card p {
echo             color: #666;
echo             margin-bottom: 1.5rem;
echo             line-height: 1.6;
echo         }
echo.
echo         .app-links {
echo             display: flex;
echo             gap: 10px;
echo             flex-wrap: wrap;
echo         }
echo.
echo         .app-link {
echo             display: inline-block;
echo             padding: 10px 25px;
echo             background: linear-gradient^(45deg, #667eea, #764ba2^);
echo             color: white;
echo             text-decoration: none;
echo             border-radius: 25px;
echo             font-weight: 500;
echo             transition: transform 0.3s ease, box-shadow 0.3s ease;
echo         }
echo.
echo         .app-link:hover {
echo             transform: translateY^(-2px^);
echo             box-shadow: 0 5px 15px rgba^(102, 126, 234, 0.3^);
echo         }
echo.
echo         .github-link {
echo             display: inline-block;
echo             padding: 10px 25px;
echo             background: linear-gradient^(45deg, #333, #555^);
echo             color: white;
echo             text-decoration: none;
echo             border-radius: 25px;
echo             font-weight: 500;
echo             transition: transform 0.3s ease, box-shadow 0.3s ease;
echo             font-size: 0.9rem;
echo         }
echo.
echo         .github-link:hover {
echo             transform: translateY^(-2px^);
echo             box-shadow: 0 5px 15px rgba^(0, 0, 0, 0.3^);
echo             background: linear-gradient^(45deg, #555, #777^);
echo         }
echo.
echo         .features {
echo             padding: 4rem 0;
echo             text-align: center;
echo             color: white;
echo         }
echo.
echo         .features-grid {
echo             display: grid;
echo             grid-template-columns: repeat^(auto-fit, minmax^(250px, 1fr^)^);
echo             gap: 2rem;
echo             margin-top: 2rem;
echo         }
echo.
echo         .feature {
echo             padding: 2rem;
echo             background: rgba^(255, 255, 255, 0.1^);
echo             border-radius: 15px;
echo             backdrop-filter: blur^(10px^);
echo         }
echo.
echo         .feature-icon {
echo             font-size: 2.5rem;
echo             margin-bottom: 1rem;
echo         }
echo.
echo         footer {
echo             background: rgba^(0, 0, 0, 0.8^);
echo             color: white;
echo             text-align: center;
echo             padding: 2rem 0;
echo             margin-top: 2rem;
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
echo                 font-size: 2.5rem;
echo             }
echo             
echo             .hero p {
echo                 font-size: 1.1rem;
echo             }
echo             
echo             .apps-grid {
echo                 grid-template-columns: 1fr;
echo             }
echo             
echo             .nav {
echo                 display: none;
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
echo                     ^<a href="#apps"^>Applications^</a^>
echo                     ^<a href="#features"^>Features^</a^>
echo                     ^<a href="#contact"^>Contact^</a^>
echo                 ^</nav^>
echo             ^</div^>
echo         ^</div^>
echo     ^</header^>
echo.
echo     ^<section class="hero"^>
echo         ^<div class="container"^>
echo             ^<h1^>Professional Business Solutions^</h1^>
echo             ^<p^>Streamline your workflow with our comprehensive suite of business applications^</p^>
echo             ^<a href="#apps" class="cta-button"^>Explore Applications^</a^>
echo         ^</div^>
echo     ^</section^>
echo.
echo     ^<div class="container"^>
echo         ^<section id="apps" class="apps-section"^>
echo             ^<h2 class="section-title"^>Business Applications^</h2^>
echo             ^<div class="apps-grid"^>
) > temp_index.html

REM Add app cards for each HTML file
for %%f in (*.html) do (
    if /i not "%%f"=="index.html" (
        call :add_app_card "%%f"
    )
)

REM Add the rest of the HTML
(
echo             ^</div^>
echo         ^</section^>
echo     ^</div^>
echo.
echo     ^<section id="features" class="features"^>
echo         ^<div class="container"^>
echo             ^<h2 class="section-title" style="color: white;"^>Why Choose AppLi?^</h2^>
echo             ^<div class="features-grid"^>
echo                 ^<div class="feature"^>
echo                     ^<div class="feature-icon"^>⚡^</div^>
echo                     ^<h3^>Fast ^& Efficient^</h3^>
echo                     ^<p^>Optimized applications that work seamlessly across all devices^</p^>
echo                 ^</div^>
echo                 ^<div class="feature"^>
echo                     ^<div class="feature-icon"^>🔒^</div^>
echo                     ^<h3^>Secure ^& Private^</h3^>
echo                     ^<p^>Your data stays on your device with no external dependencies^</p^>
echo                 ^</div^>
echo                 ^<div class="feature"^>
echo                     ^<div class="feature-icon"^>🎯^</div^>
echo                     ^<h3^>Professional Grade^</h3^>
echo                     ^<p^>Enterprise-quality tools designed for business professionals^</p^>
echo                 ^</div^>
echo                 ^<div class="feature"^>
echo                     ^<div class="feature-icon"^>🔄^</div^>
echo                     ^<h3^>Always Updated^</h3^>
echo                     ^<p^>Regular updates with new features and improvements^</p^>
echo                 ^</div^>
echo             ^</div^>
echo         ^</div^>
echo     ^</section^>
echo.
echo     ^<footer id="contact"^>
echo         ^<div class="container"^>
echo             ^<p^>^&copy; 2025 AppLi - Professional Business Solutions. All rights reserved.^</p^>
echo             ^<p^>Streamline your business operations with our comprehensive application suite.^</p^>
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
echo         // Add loading animation to app cards
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
echo         document.querySelectorAll^('.app-card'^).forEach^(card =^> {
echo             card.style.opacity = '0';
echo             observer.observe^(card^);
echo         }^);
echo.
echo         // Add click analytics ^(optional^)
echo         document.querySelectorAll^('.app-link'^).forEach^(link =^> {
echo             link.addEventListener^('click', function^(^) {
echo                 console.log^(`Launching: ${this.textContent}`^);
echo             }^);
echo         }^);
echo     ^</script^>
echo ^</body^>
echo ^</html^>
) >> temp_index.html

REM Replace the original index.html
move temp_index.html index.html

goto :eof

REM Function to add individual app card
:add_app_card
set "filename=%~1"
set "basename=%~n1"
set "displayname=%basename:_= %"

REM Determine icon and description based on filename
set "icon=📱"
set "description=Professional business application designed to streamline your workflow and improve productivity."

echo %basename% | findstr /i "invoice" >nul && (
    set "icon=📊"
    set "description=Create professional invoices quickly and efficiently. Generate branded invoices with automatic calculations and export options."
)

echo %basename% | findstr /i "finance" >nul && (
    set "icon=💰"
    set "description=Comprehensive financial calculations including loan payments, investment returns, and budget planning tools."
)

echo %basename% | findstr /i "price" >nul && (
    set "icon=📈"
    set "description=Monitor product prices across multiple platforms, set alerts, and analyze market trends for better purchasing decisions."
)

echo %basename% | findstr /i "seo" >nul && (
    set "icon=🔍"
    set "description=Optimize your website's search engine performance with keyword analysis, ranking tracking, and SEO auditing tools."
)

echo %basename% | findstr /i "social" >nul && (
    set "icon=📱"
    set "description=Manage your social media presence with content scheduling, analytics, and engagement tracking across platforms."
)

echo %basename% | findstr /i "travel" >nul && (
    set "icon=✈️"
    set "description=Plan and manage business trips with expense tracking, itinerary management, and travel optimization features."
)

(
echo                 ^<div class="app-card"^>
echo                     ^<div class="app-icon"^>!icon!^</div^>
echo                     ^<h3^>!displayname!^</h3^>
echo                     ^<p^>!description!^</p^>
echo                     ^<div class="app-links"^>
echo                         ^<a href="!filename!" class="app-link"^>Launch App^</a^>
echo                         ^<a href="https://github.com/Lojikli/AppLi/blob/master/!filename!" class="github-link" target="_blank"^>View Code^</a^>
echo                     ^</div^>
echo                 ^</div^>
) >> temp_index.html

goto :eof